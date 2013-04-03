require 'generators/angular_velocity/angular_config'

module AngularVelocity
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include AngularVelocity::Generators::AngularConfig
      source_root File.expand_path("../templates", __FILE__)
  
      desc "This generator installs angular.js with a default folder layout in app/assets/javascripts/" 

      def inject_angular
        append_to_file "app/assets/javascripts/application.js" do
          "//= require angular.js\n//= require app\n//= require_directory ./controllers\n//= require_directory ./models\n//= require_tree ./views"
        end
      end

      def create_application
        template "application.coffee", "#{angular_path}/app.coffee"
        %W{controllers services models views}.each do |dir|
          empty_directory "#{angular_path}/#{dir}" 
        end
        %W{angular angular-cookies angular-mocks angular-resource angular-sanitize angular-scenario}.each do |file|
          copy_file "#{file}.js", "#{angular_path}/#{file}.js"
        end
      end

      def create_main_controller
        template "main_controller.coffee", "#{angular_path}/controllers/main_controller.coffee"
        copy_file "main_controller.html", "#{angular_path}/views/main_controller.html"

      end



    end
  end
end