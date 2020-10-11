output "vpc_id" {
  value = module.this.vpc.id
}

output "subnet_private_ids" {
  value = module.this.subnet_private_ids
}

output "subnet_public_ids" {
  value = module.this.subnet_public_ids
}