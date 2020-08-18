# Terraform Module - VPC

[![Open Source Helpers](https://www.codetriage.com/punkerside/terraform-aws-vpc/badges/users.svg)](https://www.codetriage.com/punkerside/terraform-aws-vpc)
[![GitHub Issues](https://img.shields.io/github/issues/punkerside/terraform-aws-vpc.svg)](https://github.com/punkerside/terraform-aws-vpc/issues)
[![GitHub Tag](https://img.shields.io/github/tag-date/punkerside/terraform-aws-vpc.svg?style=plastic)](https://github.com/punkerside/terraform-aws-vpc/tags/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## AWS Resources

* Virtual Private Cloud
* Subnet
* Internet Gateway
* NAT Gateway
* Elastic IP Addresses
* Route Table

## Usage

```hcl
module "vpc" {
  source     = "punkerside/vpc/aws"
  version    = "0.0.2"

  project    = "falcon"
  env        = "sandbox"
  cidr_block = "10.0.0.0/16"
  cidr_pri   = ["10.0.0.0/18","10.0.64.0/18"]
  cidr_pub   = ["10.0.128.0/18","10.0.192.0/18"]
}
```

## Examples

* [Basic](https://github.com/punkerside/terraform-aws-vpc/tree/master/examples/basic)
* [Full](https://github.com/punkerside/terraform-aws-vpc/tree/master/examples/full)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.29 |
| aws | ~> 2.65.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.65.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_block | CIDR block | `string` | `"10.0.0.0/16"` | no |
| cidr\_pri | CIDR blocks for private subnets | `list(string)` | <pre>[<br>  "10.0.0.0/18",<br>  "10.0.64.0/18"<br>]</pre> | no |
| cidr\_pub | CIDR blocks for public subnets | `list(string)` | <pre>[<br>  "10.0.128.0/18",<br>  "10.0.192.0/18"<br>]</pre> | no |
| enable\_dns\_hostnames | Hostname DNS support | `bool` | `true` | no |
| enable\_dns\_support | DNS support | `bool` | `true` | no |
| env | Environment name | `string` | `"sandbox"` | no |
| project | Project's name | `string` | `"falcon"` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | VPC name |
| vpc | VPC values |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Tests

1. Install [rvm](https://rvm.io/rvm/install) and the ruby version specified in the [Gemfile](https://github.com/punkerside/terraform-aws-vpc/tree/master/Gemfile).
2. Install bundler and the gems from our Gemfile:
```
gem install bundler
bundle install
```
3. Test using `bundle exec kitchen test` from the root of the repo.

## Authors

The module is maintained by [Ivan Echegaray](https://github.com/punkerside)

## License

Apache 2 Licensed. See LICENSE for full details.