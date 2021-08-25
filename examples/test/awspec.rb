require 'awspec'
require 'aws-sdk'

vpc_name = `cd examples/test/ && terraform output name`.strip.delete('"')

ec2 = Aws::EC2::Client.new()
azs = ec2.describe_availability_zones
zone_names = azs.to_h[:availability_zones].first(2).map { |az| az[:zone_name] }

describe vpc(vpc_name.to_s) do
  it { should exist }
  it { should be_available }
  it { should have_vpc_attribute('enableDnsHostnames') }
  it { should have_tag('Name').value(vpc_name.to_s) }
  it { should have_route_table("#{vpc_name}-public") }
  zone_names.each do |az|
    it { should have_route_table("#{vpc_name}-private-#{az}") }
  end
end