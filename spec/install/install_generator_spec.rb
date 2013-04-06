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

  
  it "should generate an angular application" do
    file_should_exist('spec/tmp/app/assets/javascripts/app.coffee')
    expect('spec/tmp/app/assets/javascripts/app.coffee').to be_a_file_containing_text(%{angular.module('AngularVelocityApp', [])})
  end

  it "should create a main_angular controller like yeoman and the seed does" do
    file_should_exist('spec/tmp/app/assets/javascripts/controllers/main_controller.coffee')
    expect('spec/tmp/app/assets/javascripts/controllers/main_controller.coffee').to be_a_file_containing_text(%{angular.module('AngularVelocityApp').controller( 'MainCtrl'})
    file_should_exist('spec/tmp/app/assets/javascripts/views/main_control.html')
    expect('spec/tmp/app/assets/javascripts/views/main_control.html').to be_a_file_containing_text(%{ <li ng-repeat="thing in awesomeThings">{{thing}}</li>})
    
  end

  it "should create a main rails controller with an index view" do
    file_should_exist('spec/tmp/app/controllers/main_controller.rb')
    expect('spec/tmp/app/controllers/main_controller.rb').to be_a_file_containing_text('MainController < ApplicationController')
    file_should_exist('spec/tmp/app/views/main/index.html.erb')
  end

  it "should create a template serving rails controller to facilitate serving angular views" do
    file_should_exist('spec/tmp/app/controllers/templates_controller.rb')
    expect('spec/tmp/app/controllers/templates_controller.rb').to be_a_file_containing_text('class TemplatesController < ApplicationController')
  end

 



  
end