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
        template "app.coffee", "#{angular_path}/app.coffee"
        %W{controllers services models views}.each do |dir|
          empty_directory "#{angular_path}/#{dir}" 
        end
        %W{angular angular-cookies angular-mocks angular-resource angular-sanitize angular-scenario}.each do |file|
          copy_file "#{file}.js", "#{angular_path}/#{file}.js"
        end
      end

      def create_main_angular_controller
        template "main_controller.coffee", "#{angular_path}/controllers/main_controller.coffee"
        copy_file("main_control.html", "#{angular_path}/views/main_control.html")
      end

      def create_main_rails_controller
        empty_directory "app/views/main" 
        copy_file "index.html.erb", "app/views/main/index.html.erb"
        copy_file "main_controller.rb", "app/controllers/main_controller.rb"
        insert_into_file "config/routes.rb", :after => "Application.routes.draw do" do
          "\n" + %{  get "main/index"\n  root to: "main#index"\n}
        end
        copy_file("index.html.erb", "app/views/main/index.html.erb")

      end

      def create_templates_serving_rails_controller
        #http://stackoverflow.com/questions/12116476/rails-static-html-template-files-in-the-asset-pipeline-and-caching-in-developmen
        template "templates_controller.rb", "app/controllers/templates_controller.rb"
        insert_into_file "config/routes.rb", :after => "Application.routes.draw do" do
          "\n" + %{  get "/templates/:path.html" => "templates#file", :constraints => { :path => /.+/  }}
        end
      end




    end
  end
end