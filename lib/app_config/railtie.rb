require 'app_config'
require 'rails'

module AppConfig
  class Railtie < Rails::Railtie
    config.to_prepare do
      AppConfig.reload!
    end
  end
end
