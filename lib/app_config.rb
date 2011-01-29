require "rails"
require "app_config/railtie"

module AppConfig
  class Config < ActiveSupport::OrderedOptions
    def load!
      ["application.rb", "environments/#{Rails.env}.rb"].each do |config_file|
        file = Rails.root + "config/app_config" + config_file
        eval(File.read(file)) if File.exists?(file)
      end
    end
    
    def reload!
      clear
      load!
    end
  end

  @@config = Config.new
  
  def self.load!
    @@config.load!
  end
  
  def self.method_missing(method, *args)
    @@config.__send__(method, *args)
  end
end
