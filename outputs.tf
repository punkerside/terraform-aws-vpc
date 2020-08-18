output "name" {
  description = "VPC name"
  value       = "${var.project}-${var.env}"
}

output "aws_vpc" {
  description = "VPC values"
  value       = aws_vpc.this
}