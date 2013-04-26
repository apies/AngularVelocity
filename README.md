# AngularVelocity



## Installation

Add this line to your application's Gemfile:

    gem 'angular_velocity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install angular_velocity


## Usage


    $ rails g angular_velocity:install -f
    $ rm public/index.html


File are created under app/assets/javascripts/<application_name>/
And jasmine specs are created under spec/javascripts/<application_name>/

## Commands


    $ rails g angular_velocity:install

This command installs Angular and Jasmine into your Rails project. You can confirm Angular
is installed by going to: http://localhost:3000/. Also, you can confirm jasmine is installed by 
going to: http://localhost:3000/specs

The directory structure created will resemble:
--app<br/>
---assets<br/>
----javascripts<br/>
-----<--AppName--><br/>
--------views<br/>
--------controllers<br/>
--------services<br/>
--spec<br/>
---javascripts<br/>
----controllers<br/>
----services<br/>


    $ rails g angular_velocity:contoller <resource_name>

 This command creates a contoller template for angular along with the spec for testing. The controller is place in:

--app<br/>
---assets<br/>
----javascripts<br/>
-----<--AppName--><br/>
--------controllers<br/>
--spec<br/>
---javascripts<br/>
----controllers<br/>


    $ rails g angular_velocity:service <resource_name>

 This command creates a service template for angular along with the spec for testing. The service is place in:

--app<br/>
---assets<br/>
----javascripts<br/>
-----<--AppName--><br/>
--------services<br/>
--spec<br/>
---javascripts<br/>
----services<br/>



    $ rails g angular_velocity:scaffold <resource_name>

  This command creates all angular files and jasmine files plus the rails controller and model files for a resource.

--app<br/>
--controllers<br/>
--- <--RailsController--><br/>
--models<br/>
--- <--RailsModel--><br/>
---assets<br/>
----javascripts<br/>
-----<--AppName--><br/>
--------views<br/>
--------controllers<br/>
--------services<br/>
--spec<br/>
--controllers<br/>
--- <--RailsControllerSpec--><br/>
--models<br/>
--- <--RailsModelSpec--><br/>
---javascripts<br/>
----controllers<br/>
----services<br/>

  
