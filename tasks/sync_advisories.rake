#############################
# Rebuild advisory Markdown #
#############################
require 'net/http'
require 'erb'

desc "sync with ruby-advisory-db and rebuild Markdown files"
task :sync_advisories do
  sh "git submodule update"

  Rake::FileList["ruby-advisory-db/gems/**/*.yml"].each do |advisory|
    yaml = YAML.load_file(advisory)

    cve   = "CVE-" + yaml['cve']
    title = yaml['title'].gsub(/\s+/m, ' ')

    title = "#{cve}: #{title}"
    slug  = cve

    puts "Processing: #{title}"

    if yaml['url']['osvdb.org']
      osvdb_entry = Net::HTTP.get URI(yaml['url'])
      date = osvdb_entry[/(\d{4}-\d{2}-\d{2})\<\/td/, 1]
    else
      nvd_entry = Net::HTTP.get URI("http://web.nvd.nist.gov/view/vuln/detail?vulnId=#{cve}")
      matches = nvd_entry.match(/(\d{2})\/(\d{2})\/(\d{4})\<\/div/)

      if matches
        date = sprintf("%04d-%02d-%02d", Integer(matches[3]), Integer(matches[1]), Integer(matches[2]))
      else
        puts "Can't determine date for: #{title}"
        date = "#{yaml['cve'][/\d{4}/]}-01-01"
      end
    end

    filename = "#{date}-#{slug}.markdown"
    template = ERB.new <<-MARKDOWN
---
layout: post
title: "<%= title %>"
date: <%= date %>
comments: false
categories: [<%= yaml['gem'] %><%= ",#{yaml['framework']}" if yaml['framework'] %>]
---

### CVE ID

* <%= yaml['url'] ? "[#{cve}](#{yaml['url']})" : cve %>

### GEM NAME

* <%= yaml['gem'] %>
<% if yaml['framework'] %>
### FRAMEWORK

* <%= yaml['framework'] %>
<% end %>
### PATCHED VERSIONS
<% yaml['patched_versions'].each do |v| %>
* \`<%= v %>\`<% end %>

### DESCRIPTION

<%= yaml['description'] %>
MARKDOWN

    File.open("source/_posts/#{filename}", "w") { |file| file << template.result(binding) }
  end
end