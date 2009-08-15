require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "spreadhead"
    gem.summary = %Q{Rails content mangement for pages that shouldn't be views.}
    gem.description = %Q{Rails content mangement for pages that shouldn't be views.}
    gem.email = "jeff@socialrange.org"
    gem.homepage = "http://github.com/jeffrafter/spreadhead"
    gem.authors = ["Jeff Rafter"]
    gem.add_dependency "BlueCloth"
    gem.add_dependency "RedCloth"
    gem.add_dependency "rsl-stringex"
    gem.files = FileList["[A-Z]*", "{app,config,generators,lib,rails}/**/*", "test/{controllers,models}/**/*", "test/test_helper.rb"] 
    gem.test_files = FileList["test/{controllers,models}/**/*", "test/test_helper.rb"] 
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test => ["generator:cleanup", "generator:spreadhead"]) do |task|
  task.libs << "lib" << "test"
  task.pattern = "test/**/*_test.rb"
  task.verbose = true
end  

generators = %w(spreadhead)

namespace :generator do
  desc "Cleans up the test app before running the generator"
  task :cleanup do  
    FileUtils.rm_rf("test/rails")
    system "cd test && rails rails"

    # I don't like testing performance!
    FileUtils.rm_rf("test/rails/test/performance")

    system "echo \"\" >> test/rails/config/environments/test.rb"
    system "echo \"config.gem 'thoughtbot-shoulda', :lib => 'shoulda'\" >> test/rails/config/environments/test.rb"
    system "echo \"config.gem 'thoughtbot-factory_girl', :lib => 'factory_girl'\" >> test/rails/config/environments/test.rb"

    FileUtils.mkdir_p("test/rails/vendor/plugins")
    spreadhead_root = File.expand_path(File.dirname(__FILE__))
    system("ln -s #{spreadhead_root} test/rails/vendor/plugins/spreadhead")
  end

  desc "Run the spreadhead generator"
  task :spreadhead do
    system "cd test/rails && ./script/generate spreadhead && rake db:migrate db:test:prepare"
  end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "spreadhead #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.rdoc_files.include('app/**/*.rb')
  rdoc.rdoc_files.include('generators/**/*.rb')
end

