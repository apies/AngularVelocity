require "spec_helper"
require "generators/angular_velocity/scaffold/scaffold_generator"
require "generators/angular_velocity/controller/controller_generator"

describe AngularVelocity::Generators::ScaffoldGenerator do
  include GeneratorSpec::TestCase 
  include GenSpecHelpers
  include AngularVelocity::Generators::AngularConfig

  destination File.expand_path("../../tmp", __FILE__)

  

  context "Angular Components" do

    before(:each) do
      prepare_destination
      create_fixtures
      @resource_name = "scaffold_test"
      run_generator [@resource_name] 
      @angular_test_app_path = "#{angular_path}"
      @test_app_path = "spec/tmp/app"
      @angular_spec_path = "#{angular_spec_path}"
    end

  	it "should generate a controller" do
    	("#{@angular_test_app_path}/controllers/#{@resource_name}_controller.coffee").should be_a_file_containing_text(%{angular.module('AngularVelocityApp').controller( '#{@resource_name.camelize}Ctrl', [ '$scope', #{@resource_name.camelize}Controller ])})
      file_should_exist("#{@angular_spec_path}/controllers/#{@resource_name}_controller_spec.coffee")
  	end

    it "should generate a service" do
      file_should_exist "#{@angular_spec_path}/services/#{@resource_name}_service_spec.coffee"
      ("#{@angular_test_app_path}/services/#{@resource_name}_service.coffee").should be_a_file_containing_text(%{  class #{@resource_name.camelize}})
    end
  end

  context "Rails Components" do
    let(:resource_name) {"scaffold_test"}

    it "should create a controller and a model" do
      Rails::Generators.should_receive(:invoke).with("controller", ["scaffold_test"]).once
      Rails::Generators.should_receive(:invoke).with("angular_velocity:controller", ["scaffold_test"]).once
      Rails::Generators.should_receive(:invoke).with("angular_velocity:service", ["scaffold_test"]).once
      Rails::Generators.should_receive(:invoke).with("model", ["scaffold_test"]).once
      run_generator [resource_name]
    end


  end



end
