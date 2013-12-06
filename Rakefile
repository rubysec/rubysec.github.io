#############################
# Rebuild advisory Markdown #
#############################
require 'net/http'
require 'erb'
require 'yaml'

desc "sync with ruby-advisory-db and rebuild Markdown files"
task :sync_advisories do
  system "git submodule init"
  system "git submodule update"
  system "git submodule foreach git pull origin master"
  
  Rake::FileList["ruby-advisory-db/gems/**/*.yml"].each do |advisory|
    yaml = YAML.load_file(advisory)
    unless yaml['cve'] or yaml['osvdb']
      STDERR.puts "*** WARNING: couldn't sync '#{yaml['title']}: no CVE metadata"
      next
    end

    cve = osvdb = nil
    if yaml['cve']
      cve   = "CVE-" + yaml['cve']
    end

    if yaml['osvdb']
      osvdb = "OSVDB-" + yaml['osvdb'].to_s
    end
    
    title = yaml['title'].gsub(/\s+/m, ' ')

    title = "#{cve || osvdb}: #{title}"
    slug  = cve || osvdb
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

<% if cve %>
### CVE ID

* <%= yaml['url'] ? "[#{cve}](#{yaml['url']})" : cve %>
<% end %>

<% if osvdb %>
### OVSBD ID

* <%= yaml['url'] ? "[#{osvdb}](#{yaml['url']})" : osvdb %>
<% end%>

### GEM NAME

* <%= yaml['gem'] %>
<% if yaml['framework'] %>
### FRAMEWORK

* <%= yaml['framework'] %>
<% end %>

### PATCHED VERSIONS
<% if yaml['patched_versions'] %>
<% yaml['patched_versions'].each do |v| %>
* \`<%= v %>\`
<% end %>
<% else %>
None.
<% end %>
### DESCRIPTION

<%= yaml['description'] %>
MARKDOWN

    File.open("_posts/#{filename}", "w") { |file| file << template.result(binding) }
  end
end

