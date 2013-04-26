# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'angular_velocity/version'

Gem::Specification.new do |spec|
  spec.name          = "angular_velocity"
  spec.version       = AngularVelocity::VERSION
  spec.authors       = ["Alan Pies", "Shayne Defazio"]
  spec.email         = ["alan.lee.pies@gmail.com","shayne.defazio@move.com"]
  spec.description   = %q{Setup new rails projects for angular/jasmine, includes generators for angular MVC files.}
  spec.summary       = %q{angular/jasmine seed for rails}
  spec.homepage      = "https://github.com/apies/AngularVelocity"
  spec.license       = "MIT"

  spec.files         = (`git ls-files`.split($/)).select { |file_name| !file_name.include?("tmp") }


  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.3"
  spec.add_dependency "rake"
  spec.add_dependency "rspec"
  spec.add_dependency "jasmine-rails", "=0.3.3"
end
