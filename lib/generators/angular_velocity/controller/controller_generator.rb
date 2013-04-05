require 'generators/angular_velocity/angular_config'

#Rails.root.join('public','images','logo.png')

module AngularVelocity
  module Generators

    class ControllerGenerator < Rails::Generators::NamedBase
      include AngularVelocity::Generators::AngularConfig
      source_root File.expand_path('../templates', __FILE__)
      desc "This generator creates an angular controller"

      def create_angular_controller
        template "controller.coffee", "#{angular_path}/controllers/#{file_name}_controller.coffee"
      end

      
    end

  end
end

