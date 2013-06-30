# -*- encoding: utf-8 -*-
require File.expand_path("../lib/app_config/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "app_config"
  s.version     = AppConfig::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stefan Daschek"]
  s.email       = ["stefan@die-antwort.eu"]
  s.homepage    = "https://github.com/die-antwort/app_config"
  s.summary     = "Simple application configuration for Ruby on Rails."
  s.description = "Base settings are set via config/app_config/application.rb and can be overwritten for specific environments, similar to the configuration of the Rails framework."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "app_config"

  s.add_dependency "rails", ">= 3.0"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.4.0"
  s.add_development_dependency "ZenTest", "~> 4.4.2"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
