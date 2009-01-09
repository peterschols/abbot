require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Abbot::Target, 'config' do

  include Abbot::SpecHelpers

  before do
    @project = real_world_project
  end
  
  it "should pickup global config setting when target does not override" do
    # required property is defined in real_world/Buildfile
    @target = @project.target_for :contacts
    @target.config.required.should eql(:sproutcore)
  end
  
  it "should pickup config setting overidden in target's Buildfile config" do
    # define in real_world/frameworks/sproutcore/Buildfile
    @target = @project.target_for :sproutcore
    @target.config.required.should eql(:desktop)
    
  end
  
  it "should pickup config from parent buildfiles" do
    # define in real_world/frameworks/sproutcore/Buildfile
    @target = @project.target_for 'sproutcore/foundation'
    @target.config.required.should eql(:costello)
  end
    
end
