require "spec_helper" 

require "generators/angular_velocity/service/service_generator"

describe AngularVelocity::Generators::ServiceGenerator do

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
  

  it "should generator a post service" do
    
    ("#{angular_test_app_path}/services/post_service.coffee").should be_a_file_containing_text(%{  class Post})
  end


  it "should generate a post service spec" do
    service_spec_path = "#{angular_test_app_spec_path}/services/post_service_spec.coffee" 
    service_spec_path.should be_a_file_containing_text(%{describe "Service: Post", () ->})
  end

  
end