require "spec_helper"

require "generators/angular_velocity/install/install_generator"

describe AngularVelocity::Generators::InstallGenerator do

  include GeneratorSpec::TestCase 
  include GenSpecHelpers
  
  destination File.expand_path("../../tmp", __FILE__)

  before(:each) do 
    prepare_destination
    create_fixtures
    run_generator
  end

  context "angular and rails application" do
    it "should generate an angular application" do
      expect('spec/tmp/app/assets/javascripts/app.coffee').to be_a_file_containing_text(%{angular.module('AngularVelocityApp', [])})
      expect('spec/tmp/app/assets/javascripts/application.js').to be_a_file_containing_text(%{//= require angular.js})
      file_should_exist('spec/tmp/app/assets/javascripts/angular-mocks.js')
      file_should_exist('spec/tmp/app/assets/javascripts/angular-cookies.js')
      file_should_exist('spec/tmp/app/assets/javascripts/angular-resource.js')
      file_should_exist('spec/tmp/app/assets/javascripts/angular-sanitize.js')
    end

    it "should create a main_angular controller like yeoman and the seed does" do
      expect('spec/tmp/app/assets/javascripts/controllers/main_controller.coffee').to be_a_file_containing_text(%{angular.module('AngularVelocityApp').controller( 'MainCtrl'})
      expect('spec/tmp/app/assets/javascripts/views/main_control.html').to be_a_file_containing_text(%{ <li ng-repeat="thing in awesomeThings">{{thing}}</li>})
      
    end

    it "should create a main rails controller with an index view" do
      expect('spec/tmp/app/controllers/main_controller.rb').to be_a_file_containing_text('MainController < ApplicationController')
      expect('spec/tmp/app/views/main/index.html.erb').to be_a_file_containing_text(%{<div ng-app='AngularVelocityApp'>})
    end

    it "should create a template serving rails controller to facilitate serving angular views" do
      expect('spec/tmp/app/controllers/templates_controller.rb').to be_a_file_containing_text('class TemplatesController < ApplicationController')
      expect('spec/tmp/config/routes.rb').to be_a_file_containing_text(%{get "/templates/:path.html" => "templates#file", :constraints => { :path => /.+/  }})
    end
  end

  context "the specs" do
    it "the jasmine.yml file should be created" do
      expect("spec/tmp/spec/javascripts/support/jasmine.yml").to be_a_file_containing_text('src_files:')
    end
  end

 



  
end