ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/rails/config/environment")
require 'test_help'

$: << File.expand_path(File.dirname(__FILE__) + '/..')
gem 'thoughtbot-factory_girl'
gem 'thoughtbot-shoulda'

require 'factory_girl'
require 'shoulda'

begin
  require 'redgreen'
rescue LoadError
end

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
