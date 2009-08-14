require 'test_helper'
require File.expand_path(File.dirname(__FILE__) + "/../rails/test/factories/spreadhead")

class PageTest < ActiveSupport::TestCase

  context "When creating a page" do
    should_validate_presence_of :text, :title
    should_validate_uniqueness_of :title, :url    
    should "protect the att!"

    should "generate a url" do
      page = Factory.build(:page, :title => 'smack!')
      assert page.save
      assert_not_nil page.url
      assert_equal 'smack', page.url
    end
  end
  
  context "When retrieving a page" do
    should_have_named_scope :published

    should "use the url as the default parameter" do
      page = Factory(:page, :title => 'whammo')
      assert_equal 'whammo', page.to_param
    end    
  end
end
