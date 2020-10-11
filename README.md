# Terraform Module - VPC

[![Open Source Helpers](https://www.codetriage.com/punkerside/terraform-aws-vpc/badges/users.svg)](https://www.codetriage.com/punkerside/terraform-aws-vpc)
[![GitHub Issues](https://img.shields.io/github/issues/punkerside/terraform-aws-vpc.svg)](https://github.com/punkerside/terraform-aws-vpc/issues)
[![GitHub Tag](https://img.shields.io/github/tag-date/punkerside/terraform-aws-vpc.svg?style=plastic)](https://github.com/punkerside/terraform-aws-vpc/tags/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Usage

```hcl
module "vpc" {
  source  = "punkerside/vpc/aws"
  version = "0.0.8"

  project              = "falcon"
  env                  = "sandbox"
  cidr_block           = "10.0.0.0/16"
  cidr_pri             = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  cidr_pub             = ["10.0.96.0/19", "10.0.128.0/19", "10.0.160.0/19"]
  enable_dns_support   = true
  enable_dns_hostnames = true
}
```

## Examples

* [Basic](https://github.com/punkerside/terraform-aws-vpc/tree/master/examples/basic)
* [Full](https://github.com/punkerside/terraform-aws-vpc/tree/master/examples/full)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13.0 |
| aws | ~> 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_block | CIDR block | `string` | `"10.0.0.0/16"` | no |
| cidr\_pri | CIDR blocks for private subnets | `list(string)` | <pre>[<br>  "10.0.0.0/19",<br>  "10.0.32.0/19",<br>  "10.0.64.0/19"<br>]</pre> | no |
| cidr\_pub | CIDR blocks for public subnets | `list(string)` | <pre>[<br>  "10.0.96.0/19",<br>  "10.0.128.0/19",<br>  "10.0.160.0/19"<br>]</pre> | no |
| enable\_dns\_hostnames | Hostname DNS support | `bool` | `true` | no |
| enable\_dns\_support | DNS support | `bool` | `true` | no |
| env | Environment name | `string` | n/a | yes |
| project | Project's name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_private\_ids | Subnet private ids |
| subnet\_public\_ids | Subnet public ids |
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