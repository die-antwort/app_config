# No longer maintained

This project is no longer maintained.

The recommended way for custom configuration is now to simply use `Rails.config.x` or `Rails.config` – see https://guides.rubyonrails.org/configuring.html#custom-configuration

----

# AppConfig

Simple application configuration for Ruby on Rails. Uses plain ruby, no YAML or databases involved. Requires Rails 3.

Based on code posted by Mark Johnson: http://www.railsatwork.com/2010/11/simple-approach-for-application.html


## Installation

Add AppConfig to your Gemfile:

    gem 'app_config', :git => 'git://github.com/die-antwort/app_config.git'

Run the generator to create the directories and example files:

    rails generate app_config:install


## Usage

### Define configuration settings

Define base configuration settings in `config/app_config/application.rb`:

    AppConfig.app_title = "My Application"
    AppConfig.mail_prefix = ""

Use the files in `config/app_config/environments` for environment specific overrides, for example in `development.rb`:

    AppConfig.mail_prefix = "[DEV] "

In development, Configuration is reloaded automatically before every request, so you don't need to restart your application for changes to take effect.

### Access configuration settings

Access configuration settings, for example, in a mailer:

    class UserMailer < ActionMailer::Base
      def welcome_email(user)
        mail(:to => user.email, 
          :subject => "#{AppConfig.mail_prefix}Welcome to #{AppConfig.app_title}!")
      end
    end

Note: AppConfig inherits from [ActiveSupport::OrderedOptions](http://api.rubyonrails.org/classes/ActiveSupport/OrderedOptions.html), so accessing undefined settings will always return `nil`.


## Project Info

AppConfig is hosted on Github: http://github.com/die-antwort/app_config, where your contributions, forkings, comments and feedback are greatly welcomed.

Copyright © 2011 Stefan Daschek, released under the MIT license.
