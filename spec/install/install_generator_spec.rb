require "spec_helper"
require "generators/angular_velocity/install/install_generator"

describe AngularVelocity::Generators::InstallGenerator do

  include GeneratorSpec::TestCase 
  include GenSpecHelpers
  include AngularVelocity::Generators::AngularConfig
  
  destination File.expand_path("../../tmp", __FILE__)

  
  before(:each) do 
    prepare_destination
    create_fixtures
    run_generator
    @angular_test_app_path = "spec/tmp/#{angular_path}"
    @test_app_path = "spec/tmp/app"
    @angular_spec_path = "spec/tmp/#{angular_spec_path}"

  end

  context "angular components" do

    it "should generate an angular application" do
      expect("#{@angular_test_app_path}/app.coffee").to be_a_file_containing_text(%{angular.module('AngularVelocityApp', [])})
      expect("#{@test_app_path}/assets/javascripts/application.js").to be_a_file_containing_text(%{//= require ./AngularVelocityApp/angular.js})
      file_should_exist("#{@angular_test_app_path}/angular-mocks.js")
      file_should_exist("#{@angular_test_app_path}/angular-cookies.js")
      file_should_exist("#{@angular_test_app_path}/angular-resource.js")
      file_should_exist("#{@angular_test_app_path}/angular-sanitize.js")
    end

    it "should package the angular app in an easy to consume sprockets file" do
      expect("#{@angular_test_app_path}/AngularVelocityAppLoader.js").to be_a_file_containing_text("//= require ./app")
    end

    it "should create a main_angular controller like yeoman and the seed does" do
      expect("#{@angular_test_app_path}/controllers/main_controller.coffee").to be_a_file_containing_text(%{angular.module('AngularVelocityApp').controller( 'MainCtrl'})
      expect("#{@angular_test_app_path}/views/main_control.html").to be_a_file_containing_text(%{ <li ng-repeat="thing in awesomeThings">{{thing}}</li>})      
    end
  end

  context "rails components" do

    it "should create a main rails controller with an index view" do
      expect('spec/tmp/app/controllers/main_controller.rb').to be_a_file_containing_text('MainController < ApplicationController')
      expect('spec/tmp/app/views/main/index.html.erb').to be_a_file_containing_text(%{<div ng-app='AngularVelocityApp'>})
      expect('spec/tmp/app/views/main/index.html.erb').to be_a_file_containing_text(%{<%= javascript_include_tag "AngularVelocityApp/AngularVelocityAppLoader" %>})
    end

    it "should create a template serving rails controller to facilitate serving angular views" do
      expect("#{@test_app_path}/controllers/templates_controller.rb").to be_a_file_containing_text('class TemplatesController < ApplicationController')
      expect('spec/tmp/config/routes.rb').to be_a_file_containing_text(%{get "/templates/:path.html" => "templates#file", :constraints => { :path => /.+/  }})
    end

    it "should create an initializer for jasmine rails that requires it" do
      expect("spec/tmp/config/initializers/angular_velocity.rb").to be_a_file_containing_text("require 'jasmine-rails'")
    end


  end

  context "the specs" do
    
    it "the jasmine.yml file should be created" do
      expect("spec/tmp/spec/javascripts/support/jasmine.yml").to be_a_file_containing_text('src_files:')
    end

    it "the routes config file should contain a route for the jasmine specs" do
      expect('spec/tmp/config/routes.rb').to be_a_file_containing_text(%{mount JasmineRails::Engine => "/specs" unless Rails.env.production?})
    end

    it "the main controller spec should be created" do
      expect("#{@angular_spec_path}/controllers/main_controller_spec.coffee").to be_a_file_containing_text(%{describe "Controller: MainCtrl", () ->})
    end


  end

 



  
end