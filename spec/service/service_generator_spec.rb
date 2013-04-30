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
  

  it "should generator a post service" do
    
    ("#{angular_path}/services/post_service.coffee").should be_a_file_containing_text(%{  class Post})
  end


  it "should generate a post service spec" do
    service_spec_path = "#{angular_spec_path}/services/post_service_spec.coffee" 
    service_spec_path.should be_a_file_containing_text(%{describe "Service: Post", () ->})
  end

  
end