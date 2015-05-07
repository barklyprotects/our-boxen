require 'spec_helper'

describe 'quicksilver' do

  version = '1.1.3'

  it { should contain_class('quicksilver') }
  it { should contain_package("Quicksilver-#{version}").with_provider('appdmg') }
  it { should contain_package("Quicksilver-#{version}").with_source("https://dl.dropboxusercontent.com/s/1k73bxr6n6364en/Quicksilver-#{version}.dmg") }

end
