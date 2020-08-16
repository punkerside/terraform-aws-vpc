provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source  = "punkerside/vpc/aws"
  version = "0.0.2"

  project              = "falcon"
  env                  = "sandbox"
  cidr_block           = "10.0.0.0/16"
  cidr_pri             = ["10.0.0.0/18","10.0.64.0/18"]
  cidr_pub             = ["10.0.128.0/18","10.0.192.0/18"]
  enable_dns_support   = true
  enable_dns_hostnames = true
}