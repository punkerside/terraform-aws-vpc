require 'awspec'
require 'aws-sdk'

vpc_name = `cd examples/test/ && terraform output name`.strip.delete('"')

describe vpc(vpc_name.to_s) do
  it { should exist }
  it { should be_available }
  it { should have_vpc_attribute('enableDnsHostnames') }
end