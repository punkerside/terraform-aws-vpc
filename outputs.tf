output "name" {
  description = "VPC name"
  value       = "${var.project}-${var.env}"
}

output "vpc" {
  description = "VPC values"
  value       = aws_vpc.this
}