require 'test_helper'
require File.expand_path(File.dirname(__FILE__) + "/../rails/test/factories/spreadhead")

class PageTest < ActiveSupport::TestCase

  context "When creating a page" do
    setup { Factory(:page) }
    
    should_validate_presence_of :text, :title
    should_validate_uniqueness_of :title

    should "generate a url" do
      page = Factory.build(:page, :title => 'smack!')
      assert page.save
      assert_not_nil page.url
      assert_equal 'smack', page.url
    end

    should "accept a url" do
      page = Factory.build(:page, :title => 'smackdown!', :url => 'whammo')
      assert page.save
      assert_not_nil page.url
      assert_equal 'whammo', page.url
    end

    should "not duplicate urls" do
      page = Factory.build(:page, :title => 'smurf', :url => 'bunnies')
      assert page.save
      assert_not_nil page.url
      assert_equal 'bunnies', page.url
      page = Factory.build(:page, :title => 'bunnies', :url => nil)
      assert page.save
      assert_not_nil page.url
      assert_not_equal 'bunnies', page.url
    end

    should "modify the submitted url and be valid if duplicate url is submitted" do
      page = Factory(:page, :title => 'smurf', :url => 'bunnies')
      dup = Factory.build(:page, :title => 'smurffette', :url => 'bunnies')
      assert dup.valid?
      assert_not_equal page.url, dup.url
      assert dup.save
      assert !dup.errors.on(:url)
    end

  end
  
  context "When retrieving a page" do
    setup { Factory(:page) }

    should_have_named_scope :published
  end
end
