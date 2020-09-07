output "name" {
  description = "VPC name"
  value       = "${var.project}-${var.env}"
}

output "vpc" {
  description = "VPC values"
  value       = aws_vpc.this
}

output "subnet_private_ids" {
  description = "Subnet private ids"
  value       = aws_subnet.private.*.id
}

output "subnet_public_ids" {
  description = "Subnet public ids"
  value       = aws_subnet.public.*.id
}

output "cidr_private" {
  description = "CIDR privates"
  value       = var.cidr_pri
}

output "cidr_public" {
  description = "CIDR publics"
  value       = var.cidr_pub
}