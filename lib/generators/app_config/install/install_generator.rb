module AppConfig
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    argument :additional_environments, :optional => true, :type => :array, :banner => "additional_env additional_env", :default => []
    
    def copy_files
      template "application.rb", "config/app_config/application.rb"
      (%w{development test production} + additional_environments).each do |environment|
        template "environment.rb", "config/app_config/environments/#{environment}.rb"
      end
    end
  end
end
