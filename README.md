# Terraform Module - VPC

[![Open Source Helpers](https://www.codetriage.com/punkerside/terraform-aws-vpc/badges/users.svg)](https://www.codetriage.com/punkerside/terraform-aws-vpc)
[![GitHub Issues](https://img.shields.io/github/issues/punkerside/terraform-aws-vpc.svg)](https://github.com/punkerside/terraform-aws-vpc/issues)
[![GitHub Tag](https://img.shields.io/github/tag-date/punkerside/terraform-aws-vpc.svg?style=plastic)](https://github.com/punkerside/terraform-aws-vpc/tags/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Usage

```hcl
module "vpc" {
  source  = "punkerside/vpc/aws"
  version = "0.0.10"

  name                 = "falcon"
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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.68.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.68.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_availability_zones.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Bloque CIDR | `string` | `"10.0.0.0/16"` | no |
| <a name="input_cidr_pri"></a> [cidr\_pri](#input\_cidr\_pri) | Segmentos de redes privadas | `list(string)` | <pre>[<br>  "10.0.0.0/19",<br>  "10.0.32.0/19",<br>  "10.0.64.0/19"<br>]</pre> | no |
| <a name="input_cidr_pub"></a> [cidr\_pub](#input\_cidr\_pub) | Segmentos de redes publicas | `list(string)` | <pre>[<br>  "10.0.96.0/19",<br>  "10.0.128.0/19",<br>  "10.0.160.0/19"<br>]</pre> | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Activar DNS Hostname | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Soporte DNS | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Nombre asignado a todos los recursos creados por esta plantilla | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Etiquetas asociadas a los recursos creados | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_private_ids"></a> [subnet\_private\_ids](#output\_subnet\_private\_ids) | Subnet private ids |
| <a name="output_subnet_public_ids"></a> [subnet\_public\_ids](#output\_subnet\_public\_ids) | Subnet public ids |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | VPC values |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Tests

1. Install [rvm](https://rvm.io/rvm/install) and the ruby version specified in the [Gemfile](https://github.com/punkerside/terraform-aws-vpc/tree/master/Gemfile).
2. Install bundler and the gems from our Gemfile:
```
gem install bundler
bundle install
```
3. Test using `bundle exec kitchen test` from the root of the repo.

## Docs

```sh
pre-commit run -a
```

## Authors

The module is maintained by [Ivan Echegaray](https://github.com/punkerside)

## License

Apache 2 Licensed. See LICENSE for full details.