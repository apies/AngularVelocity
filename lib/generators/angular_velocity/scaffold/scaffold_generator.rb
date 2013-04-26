require 'generators/angular_velocity/angular_config' 
require "generators/angular_velocity/controller/controller_generator"

#Rails.root.join('public','images','logo.png')

module AngularVelocity
  module Generators

    class ScaffoldGenerator < Rails::Generators::NamedBase

      include AngularVelocity::Generators::AngularConfig
  	  source_root File.expand_path('../../controller/templates', __FILE__)    
      desc "This generator creates an angular service"

      def run_rails_generators
        pp "2"
        Rails::Generators.invoke("controller", [file_name])
        Rails::Generators.invoke("model", [file_name])
      end

      def run_angular_generators
        pp "2"
        Rails::Generators.invoke("angular_velocity:controller", [file_name])
        Rails::Generators.invoke("angular_velocity:service", [file_name])
      end




    end
  end
end