require 'test_helper'
require File.expand_path(File.dirname(__FILE__) + "/../rails/test/factories/spreadhead")

class PagesControllerTest < ActionController::TestCase

  tests Spreadhead::PagesController

  context "on GET to #new" do
    setup { get :new }

    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on GET to #index" do
    setup { get :index }

    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end

  context "on GET to #show" do
    setup do
      page = Factory(:page)
      get :show, :id => page.url 
    end  

    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
  end

  context "on GET to #edit" do
    setup do
      page = Factory(:page)
      get :edit, :id => page.url
    end  

    should_respond_with :success
    should_render_template :edit
    should_not_set_the_flash
  end

  context "on POST to #create with valid attributes" do
    setup do
      page_attributes = Factory.attributes_for(:page)
      post :create, :page => page_attributes
    end
      
    should_respond_with :redirect
    should_not_set_the_flash
  end
  
  context "on PUT to #update with valid attributes" do
    setup do
      page = Factory(:page)              
      put :update, :id => page.url, :page => page.attributes
    end
      
    should_respond_with :redirect
    should_not_set_the_flash
  end
  
  context "on DELETE to #destroy with valid attributes" do
    setup do
      page = Factory(:page)
      delete :destroy, :id => page.url
    end
    
    should_respond_with :redirect
    should_not_set_the_flash

    should "Destroy the page" do
      page = Factory(:page)
      assert_difference 'Page.count' do
        delete :destroy, :id => page.url
      end          
    end

  end
end
