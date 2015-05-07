require 'spec_helper'
# Rename this file to classname_spec.rb
# Check other boxen modules for examples
# or read http://rspec-puppet.com/tutorial/
describe 'cmake' do
  let(:pre_condition) { "class homebrew {}" }

  it { should contain_class('cmake') }
  it { should contain_package('cmake') }
end
