require 'awspec'
require 'aws-sdk'

vpc_name = `cd examples/test/ && terraform output vpc`.strip.delete('"')
subnet_private = `cd examples/test/ && terraform output subnet_private`

describe vpc(vpc_name.to_s) do
  it { should exist }
  it { should be_available }
  it { should have_vpc_attribute('enableDnsHostnames') }
  it { should have_vpc_attribute('enableDnsSupport') }
end