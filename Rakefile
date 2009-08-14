# encoding: utf-8

require 'rake'
require 'rake/testtask'
require 'cucumber/rake/task'

namespace :test do
  Rake::TestTask.new(:basic => ["generator:cleanup",
                                "generator:spreadhead",
                                "generator:spreadhead_features"]) do |task|
    task.libs << "lib"
    task.libs << "test"
    task.pattern = "test/**/*_test.rb"
    task.verbose = false
  end
  
=begin
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts   = "--format progress"
    t.feature_pattern = "test/rails_root/features/*.feature"
  end

  Cucumber::Rake::Task.new(:features_for_views) do |t|
    t.cucumber_opts   = "--format progress"
    t.feature_pattern = "test/rails_root/features/*.feature"
  end
=end  
end

generators = %w(spreadhead spreadhead_features)

namespace :generator do
  desc "Cleans up the test app before running the generator"
  task :cleanup do  
    FileUtils.rm_rf("test/rails")
    system "cd test && rails rails"

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

  desc "Run the spreadhead features generator"
  task :spreadhead_features do
    system "cd test/rails && ./script/generate spreadhead_features"
  end
end

desc "Run the test suite"
task :default => ['test:basic', 'test:features',
                  'test:views', 'test:features_for_views']

gem_spec = Gem::Specification.new do |gem_spec|
  gem_spec.name        = "spreadhead"
  gem_spec.version     = "0.1.0"
  gem_spec.summary     = "Rails content mangement for pages that shouldn't be views."
  gem_spec.email       = "jeff@socialrange.org"
  gem_spec.homepage    = "http://github.com/jeffrafter/spreadhead"
  gem_spec.description = "Rails content mangement for pages that shouldn't be views."
  gem_spec.authors     = ["Jeff Rafter"]
  gem_spec.files       = FileList["[A-Z]*", "{app,config,generators,lib,shoulda_macros,rails}/**/*"]
end

desc "Generate a gemspec file"
task :gemspec do
  File.open("#{gem_spec.name}.gemspec", 'w') do |f|
    f.write gem_spec.to_yaml
  end
end

