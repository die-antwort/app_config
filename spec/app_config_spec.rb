require 'spec_helper'

describe AppConfig do
  before(:each) do
    Rails.stub(:root => Pathname.new("RAILS_ROOT"), :env => "development")
    File.stub(:exists? => false, :read => "AppConfig.test_setting = 1")
  end

  describe "#load!" do
    it "evals config/app_config/application.rb (if it exists)" do
      File.should_receive(:exists?).with(Pathname.new("RAILS_ROOT/config/app_config/application.rb")).and_return(true)
      AppConfig.load!
      AppConfig.test_setting.should == 1
    end
  
    it "evals config/app_config/environments/{RAILS_ENV}.rb" do
      File.should_receive(:exists?).with(Pathname.new("RAILS_ROOT/config/app_config/environments/development.rb")).and_return(true)
      AppConfig.load!
      AppConfig.test_setting.should == 1
    end
  end
  
  describe "#reload!" do
    it "clears settings and loads them again" do
      File.stub(:exists? => true)
      AppConfig.load!     
      AppConfig.test_setting.should == 1
      
      AppConfig.test_setting = 23
      AppConfig.test_setting_2 = "foobar"

      AppConfig.reload!
      AppConfig.test_setting.should == 1
      AppConfig.test_setting_2.should be_nil
    end
  end
  
end
