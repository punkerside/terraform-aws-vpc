output "name" {
  description = "Nombre de VPC"
  value       = "${var.project}-${var.env}"
}

output "aws_vpc" {
  description = "Valores de VPC"
  value       = aws_vpc.this
}