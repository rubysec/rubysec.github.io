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
    unless yaml['cve']
      STDERR.puts "*** WARNING: couldn't sync '#{yaml['title']}: no CVE metadata"
      next
    end

    cve   = "CVE-" + yaml['cve']
    title = yaml['title'].gsub(/\s+/m, ' ')

    title = "#{cve}: #{title}"
    slug  = cve
    date  = yaml['date']

    STDERR.puts "Processing: #{title}"

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
