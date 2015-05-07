require 'spec_helper'

describe 'java6' do

  it { should contain_class('java6') }
  it { should contain_package('java6').with_provider('appdmg') }
  it { should contain_package('java6').with_source('http://supportdownload.apple.com/download.info.apple.com/Apple_Support_Area/Apple_Software_Updates/Mac_OS_X/downloads/041-9846.20130303.CPp69/JavaForOSX2013-002.dmg') }

end
