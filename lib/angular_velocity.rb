require "angular_velocity/version"
require "jasmine-rails"

module AngularVelocity

  def self.setup
    yield self
  end

  unless File.file?("#{Dir.pwd}/spec/javascripts/support/jasmine.yml")
    FileUtils.mkdir_p "#{Dir.pwd}/spec/javascripts/support/"
    File.open("#{Dir.pwd}/spec/javascripts/support/jasmine.yml", "w") do |file_line|
      file_line.puts "Hello"
      file_line.puts "world"
    end
  end
end
