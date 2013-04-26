require 'generators/angular_velocity/angular_config' 
require "generators/angular_velocity/controller/controller_generator"

#Rails.root.join('public','images','logo.png')

module AngularVelocity
  module Generators

    class ScaffoldGenerator < Rails::Generators::NamedBase

      include AngularVelocity::Generators::AngularConfig
  	  source_root File.expand_path('../../controller/templates', __FILE__)    
      desc "This generator creates an angular service"

      def run_scaffold_generators
        Rails::Generators.invoke("angular_velocity:controller", [file_name])
      end 
    end
  end
end