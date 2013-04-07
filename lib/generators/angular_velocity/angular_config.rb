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
        "app/assets/javascripts/"
      end

      def angular_spec_path
        "spec/javascripts"
      end

    end
  end
end