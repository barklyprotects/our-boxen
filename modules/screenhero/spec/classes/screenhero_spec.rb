require 'spec_helper'

describe 'screenhero' do
  it do
    should contain_package('Screenhero').with({
      :provider => 'appdmg',
      :source   => 'http://dl.screenhero.com/update/screenhero/Screenhero.dmg'
    })
  end
end