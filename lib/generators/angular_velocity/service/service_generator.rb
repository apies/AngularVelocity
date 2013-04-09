require 'generators/angular_velocity/angular_config'

#Rails.root.join('public','images','logo.png')

module AngularVelocity
  module Generators

    class ServiceGenerator < Rails::Generators::NamedBase
      include AngularVelocity::Generators::AngularConfig
      source_root File.expand_path('../templates', __FILE__)
      desc "This generator creates an angular service"

      def create_angular_service
        template "service.coffee", "#{angular_path}/services/#{file_name}_service.coffee"
      end
      
    end

  end
end

