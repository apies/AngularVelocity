require "spec_helper" 

require "generators/angular_velocity/service/service_generator"

describe AngularVelocity::Generators::ServiceGenerator do

  include GeneratorSpec::TestCase
  include GenSpecHelpers 
  include AngularVelocity::Generators::AngularConfig
  
  destination File.expand_path("../../tmp", __FILE__)

  before(:each) {prepare_destination}

  let(:angular_test_app_path) { "spec/tmp/#{angular_path}" }
  

  it "should generator a controller" do
    run_generator ["post"]
    ("#{angular_test_app_path}/services/post_service.coffee").should be_a_file_containing_text(%{  class Post})
  end

  
end