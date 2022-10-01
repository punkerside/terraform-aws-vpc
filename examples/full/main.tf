module "vpc" {
  source  = "punkerside/vpc/aws"
  version = "0.0.11"

  project              = "falcon"
  env                  = "sandbox"
  cidr_block           = "10.0.0.0/16"
  cidr_pri             = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  cidr_pub             = ["10.0.96.0/19", "10.0.128.0/19", "10.0.160.0/19"]
  enable_dns_support   = true
  enable_dns_hostnames = true
}