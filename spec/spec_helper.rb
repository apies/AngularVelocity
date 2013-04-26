ENV["RAILS_ENV"] = 'test'

require 'rails/all'
require 'rspec-rails'
#require 'rails/generators/test_case'
require "generator_spec/test_case"
require 'generators/angular_velocity/angular_config'

Dir["./spec/support/*.rb"].each {|f| require f}

module AngularVelocity
  class Application < ::Rails::Application
  end
end


module GenSpecHelpers 

  def create_fixtures
    Dir.mkdir("spec/tmp/config") unless Dir.entries("spec/tmp/").include?("config")
    FileUtils.mkdir_p('spec/tmp/app/assets/javascripts/') #unless Dir.entries("spec/tmp/").include?("AngularVelocityApp")
    File.open('spec/tmp/app/assets/javascripts/application.js', 'w') do |f|
      pp "IN create_fixtures"
      f.puts "//= require jquery"
      f.puts "//= require jquery_ujs"
      f.puts "//= require_tree ."
    end
    File.open("spec/tmp/config/routes.rb", 'w') do |f|
      f.puts "Gui::Application.routes.draw do"
      f.puts "end" 
    end
    FileUtils.mkdir_p("#{angular_path}/controllers")
  end

  def file_should_exist(file_string)
    File.file?(file_string).should be_true
  end

end




# RSpec.configure do |config|
#   config.treat_symbols_as_metadata_keys_with_true_values = true
#   config.filter_run :focus
#   config.run_all_when_everything_filtered = true
#   config.before(:each) do
#     @real_world = RSpec.world
#     RSpec.instance_variable_set(:@world, RSpec::Core::World.new)
#   end
#   config.after(:each) do
#     RSpec.instance_variable_set(:@world, @real_world)
#   end
#   config.order = :random
# end
