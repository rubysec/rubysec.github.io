require 'date'
require 'yaml'

namespace :advisories do
  file '_advisories' do
    system 'git clone --depth 1 https://github.com/rubysec/ruby-advisory-db _advisories'
  end

  desc 'Updates the advisory db'
  task :update => '_advisories' do
    Dir.chdir('_advisories') { sh 'git pull --ff-only' } unless ENV['CI']
  end

  desc 'Regenerate the advisory posts'
  task :generate => :update do
    Rake::FileList['_advisories/gems/*/*.yml'].each do |advisory_path|
      advisory = YAML.safe_load_file(advisory_path, permitted_classes: [Date])

      id   = if advisory['cve'] then "CVE-#{advisory['cve']}"
             elsif advisory['ghsa'] then "GHSA-#{advisory['ghsa']}"
             elsif advisory['osvdb'] then "OSVDB-#{advisory['osvdb']}"
             else File.basename(advisory_path, ".*")
             end
      slug = "#{advisory['date']}-#{id}"
      post = File.join('advisories', '_posts', "#{slug}.md")

      File.open(post, 'w') do |file|
        header = {
          'layout'     => 'advisory',
          'title'      => "#{id} (#{advisory['gem']}): #{advisory['title']}",
          'comments'   => false,
          'categories' => [advisory['gem'], advisory['library'], advisory['framework'], advisory['platform']].compact,
          'advisory'   => advisory
        }

        YAML.dump(header, file)
        file.puts '---'
      end
    end
  end

  desc 'Commits changes to advisories/_posts/'
  task :commit do
    rev = Dir.chdir('_advisories') { %x(git rev-parse --short HEAD).strip }
    message = "Updated advisory posts against rubysec/ruby-advisory-db@#{rev}"

    sh "git add advisories/_posts/*.md"
    sh "git commit --allow-empty -m #{message.dump} advisories/_posts/"
  end
end

task :advisories => ['advisories:generate', 'advisories:commit']
