require "spec_helper" 

require "generators/angular_velocity/controller/controller_generator"

describe AngularVelocity::Generators::ControllerGenerator do

  include GeneratorSpec::TestCase
  include GenSpecHelpers 
  
  destination File.expand_path("../../tmp", __FILE__)

  before(:each) {prepare_destination}
  

  it "should generator a controller" do
    run_generator ["post"]
    file_should_exist('spec/tmp/app/assets/javascripts/controllers/post_controller.coffee')
    ('spec/tmp/app/assets/javascripts/controllers/post_controller.coffee').should be_a_file_containing_text(%{angular.module('AngularVelocityApp').controller( 'PostCtrl', [ '$scope', PostController ])})
  end

  
end