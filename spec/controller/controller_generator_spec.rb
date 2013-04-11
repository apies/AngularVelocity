require "spec_helper" 

require "generators/angular_velocity/controller/controller_generator"

describe AngularVelocity::Generators::ControllerGenerator do

  include GeneratorSpec::TestCase
  include GenSpecHelpers 
  include AngularVelocity::Generators::AngularConfig
  
  destination File.expand_path("../../tmp", __FILE__)

  before(:each) do 
    prepare_destination
    run_generator ["post"] 
  end

  let(:angular_test_app_path) { "spec/tmp/#{angular_path}" }
  let(:angular_test_app_spec_path) { "spec/tmp/#{angular_spec_path}" }
  

  it "should generate a controller" do
    ("#{angular_test_app_path}/controllers/post_controller.coffee").should be_a_file_containing_text(%{angular.module('AngularVelocityApp').controller( 'PostCtrl', [ '$scope', PostController ])})
  end

  it "should generate a post controller spec" do
    controller_spec_path = "#{angular_test_app_spec_path}/controllers/post_controller_spec.coffee" 

    controller_spec_path.should be_a_file_containing_text(%{describe "Controller: PostCtrl", () ->})
    
  end

  
end