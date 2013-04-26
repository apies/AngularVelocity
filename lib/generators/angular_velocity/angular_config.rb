module AngularVelocity
  module Generators
    module AngularConfig

      def application_name
        if defined?(Rails) && Rails.application
          "#{Rails.application.class.name.split('::').first}App"
        else
          "App"
        end     
      end

      def angular_path
        path = ""
        if Rails.env == "test"
          path = "spec/tmp/app/assets/javascripts/#{application_name}"
        else
          path = "app/assets/javascripts/#{application_name}"
        end
        path
      end

      def angular_spec_path
        if Rails.env == "test"
          "spec/tmp/spec/javascripts/#{application_name}"
        else
          "spec/javascripts/#{application_name}"
        end
      end

    end
  end
end