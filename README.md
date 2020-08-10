# Plantilla Terraform - VPC

[![GitHub Issues](https://img.shields.io/github/issues/punkerside/terraform-aws-template-vpc.svg)](https://github.com/punkerside/terraform-aws-template-vpc/issues)
[![GitHub Tag](https://img.shields.io/github/tag-date/punkerside/terraform-aws-template-vpc.svg?style=plastic)](https://github.com/punkerside/terraform-aws-template-vpc/tags/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Amazon Virtual Private Cloud (Amazon VPC) le permite lanzar recursos de AWS en una red virtual que haya definido. Dicha red virtual es prácticamente idéntica a las redes tradicionales que se utilizan en sus propios centros de datos, con los beneficios que supone utilizar la infraestructura escalable de AWS.

## Recursos AWS

Esta plantilla de Terraform, despliega los siguientes recursos:

* Virtual Private Cloud
* Subnet
* Internet Gateway
* NAT Gateway
* Elastic IP Addresses
* Route Table

## Prerequisite

* [Instalar Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
* [Instalar AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)