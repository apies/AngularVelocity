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
        path = Rails.root.join(path)
        path
      end

      def angular_spec_path
        path = ""
        if Rails.env == "test"
          path =  "spec/tmp/spec/javascripts/#{application_name}"
        else
          path ="spec/javascripts/#{application_name}"
        end
        path = Rails.root.join(path)
        path
      end

    end
  end
end