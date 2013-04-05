require "spec_helper"

require "generators/angular_velocity/controller/controller_generator"

describe AngularVelocity::Generators::ControllerGenerator do

  include GeneratorSpec::TestCase 
  
  destination File.expand_path("../../tmp", __FILE__)

  before(:each) {prepare_destination}
  

  it "should generator a controller" do
    run_generator ["post"]
    puts Dir.pwd
    File.file?('spec/tmp/app/assets/javascripts/controllers/post_controller.coffee').should be_true
  end

  
end