require "spec_helper"

require "generators/angular_velocity/install/install_generator"

describe AngularVelocity::Generators::InstallGenerator do

  include GeneratorSpec::TestCase 
  
  destination File.expand_path("../../tmp", __FILE__)

  before(:each) do 
    prepare_destination
    create_fixtures
    run_generator
  end

  def create_fixtures
    Dir.mkdir("spec/tmp/config") unless Dir.entries("spec/tmp/").include?("config")
    FileUtils.mkdir_p('spec/tmp/app/assets/javascripts/') unless Dir.entries("spec/tmp/").include?("app")
    File.open('spec/tmp/app/assets/javascripts/application.js', 'w') do |f|
      f.puts "//= require jquery"
      f.puts "//= require jquery_ujs"
      f.puts "//= require_tree ."
    end
    File.open("spec/tmp/config/routes.rb", 'w') do |f|
      f.puts "Gui::Application.routes.draw do"
      f.puts "end" 
    end
  end
  

  it "should generator an application" do
    File.file?('spec/tmp/app/assets/javascripts/app.coffee').should be_true
  end

  it "should create a main controller" do
    File.file?('spec/tmp/app/assets/javascripts/controllers/main_controller.coffee').should be_true
  end

  
end