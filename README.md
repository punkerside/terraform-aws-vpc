# Plantilla Terraform - VPC

[![Open Source Helpers](https://www.codetriage.com/punkerside/terraform-aws-vpc/badges/users.svg)](https://www.codetriage.com/punkerside/terraform-aws-vpc)
[![GitHub Issues](https://img.shields.io/github/issues/punkerside/terraform-aws-vpc.svg)](https://github.com/punkerside/terraform-aws-vpc/issues)
[![GitHub Tag](https://img.shields.io/github/tag-date/punkerside/terraform-aws-vpc.svg?style=plastic)](https://github.com/punkerside/terraform-aws-vpc/tags/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Amazon Virtual Private Cloud (Amazon VPC) le permite crear recursos de AWS en una red virtual que haya definido. Dicha red virtual es prácticamente idéntica a las redes tradicionales que se utilizan en sus propios centros de datos, con los beneficios que supone utilizar la infraestructura escalable de AWS.

## Recursos AWS

Esta plantilla de Terraform, despliega los siguientes recursos:

* Virtual Private Cloud
* Subnet
* Internet Gateway
* NAT Gateway
* Elastic IP Addresses
* Route Table

## Uso

```hcl
module "vpc" {
  source  = "punkerside/vpc/aws"
  version = "0.0.2"

  project              = "falcon"
  env                  = "sandbox"
  cidr_block           = "10.0.0.0/16"
  cidr_pri             = ["10.0.0.0/18","10.0.64.0/18"]
  cidr_pub             = ["10.0.128.0/18","10.0.192.0/18"]
}
```

## Ejemplos

* [Basic](https://github.com/punkerside/terraform-aws-vpc/tree/master/examples/basic)
* [Full](https://github.com/punkerside/terraform-aws-vpc/tree/master/examples/full)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.7 |
| aws | ~> 2.57 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.57 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_block | Segmento CIDR de red | `string` | `"10.0.0.0/16"` | no |
| cidr\_pri | Segmentos de red privados | `list(string)` | <pre>[<br>  "10.0.0.0/18",<br>  "10.0.64.0/18"<br>]</pre> | no |
| cidr\_pub | Segmentos de red publicos | `list(string)` | <pre>[<br>  "10.0.128.0/18",<br>  "10.0.192.0/18"<br>]</pre> | no |
| enable\_dns\_hostnames | Resolucion DNS para hostname | `bool` | `true` | no |
| enable\_dns\_support | Resolucion DNS | `bool` | `true` | no |
| env | Nombre del ambiente | `string` | `"sandbox"` | no |
| project | Nombre del proyecto | `string` | `"falcon"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_vpc | Valores de VPC |
| name | Nombre de VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
