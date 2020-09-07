output "name" {
  description = "VPC name"
  value       = "${var.project}-${var.env}"
}

output "vpc" {
  description = "VPC values"
  value       = aws_vpc.this
}

output "subnet_ids" {
  description = "Subnet ids"
  value       = concat(sort(aws_subnet.private.*.id), sort(aws_subnet.public.*.id), )
}