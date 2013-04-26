require "spec_helper"
require "generators/angular_velocity/scaffold/scaffold_generator"
require "generators/angular_velocity/controller/controller_generator"

describe AngularVelocity::Generators::ScaffoldGenerator do
  include GeneratorSpec::TestCase 
  include GenSpecHelpers
  include AngularVelocity::Generators::AngularConfig

  destination File.expand_path("../../tmp", __FILE__)

  before(:each) do
  	prepare_destination
    create_fixtures
    @resource_name = "scaffold_test"
    run_generator [@resource_name] 
    @angular_test_app_path = "#{angular_path}"
    @test_app_path = "spec/tmp/app"
    @angular_spec_path = "#{angular_spec_path}"
  end

  context "Angular Components" do
  	it "should generate a controller" do
    	("#{@angular_test_app_path}/controllers/#{@resource_name}_controller.coffee").should be_a_file_containing_text(%{angular.module('AngularVelocityApp').controller( '#{@resource_name.camelize}Ctrl', [ '$scope', #{@resource_name.camelize}Controller ])})
  	end
  end



end
