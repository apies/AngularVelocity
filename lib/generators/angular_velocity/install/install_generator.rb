require 'generators/angular_velocity/angular_config' 

module AngularVelocity
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include AngularVelocity::Generators::AngularConfig
      source_root File.expand_path("../templates", __FILE__)
  
      desc "This generator installs angular.js with a default folder layout in app/assets/javascripts/" 

      def create_angular_application
        template "app.coffee", "#{angular_path}/app.coffee"
        %W{controllers services models views}.each do |dir|
          empty_directory "#{angular_path}/#{dir}" 
        end
        %W{angular angular-cookies angular-mocks angular-resource angular-sanitize angular-scenario}.each do |file|
          copy_file "#{file}.js", "#{angular_path}/#{file}.js"
        end
        insert_into_file "app/assets/javascripts/application.js", :after =>"//= require jquery_ujs" do
         "\n//= require ./#{application_name}/angular.js"
        end
      end

      def create_main_angular_controller
        template "main_controller.coffee", "#{angular_path}/controllers/main_controller.coffee"
        copy_file("main_control.html", "#{angular_path}/views/main_control.html")
        template "main_controller_spec.coffee", "#{angular_spec_path}/controllers/main_controller_spec.coffee"
      end

      def create_main_angular_service
        template "main_angular_service.coffee", "#{angular_path}/services/#{application_name}_service.coffee"
      end

      def create_main_rails_controller
        empty_directory "app/views/main" 
        template "index.html.erb", "app/views/main/index.html.erb"
        copy_file  "AppLoader.js", "#{angular_path}/#{application_name}Loader.js"
        copy_file "main_controller.rb", "app/controllers/main_controller.rb"
        insert_into_file "config/routes.rb", :after => "Application.routes.draw do" do
          "\n" + %{  get "main/index"\n  root to: "main#index"\n}
        end
      end

      def create_templates_serving_rails_controller
        #http://stackoverflow.com/questions/12116476/rails-static-html-template-files-in-the-asset-pipeline-and-caching-in-developmen
        template "templates_controller.rb", "app/controllers/templates_controller.rb"
        insert_into_file "config/routes.rb", :after => "Application.routes.draw do" do
          "\n" + %{  get "/templates/:path.html" => "templates#file", :constraints => { :path => /.+/  }}
        end
      end

      def create_angular_jasmine_link
        template "jasmine.yml", "spec/javascripts/support/jasmine.yml"
        insert_into_file "config/routes.rb", :after => "Application.routes.draw do" do
          "\n" + %{  mount JasmineRails::Engine => "/specs" unless Rails.env.production?}
        end
      end

      def create_angular_velocity_initializer
        copy_file  "angular_velocity.rb", "config/initializers/angular_velocity.rb"
      end




    end
  end
end