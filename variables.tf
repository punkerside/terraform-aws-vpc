variable "project" {
  description = "Project's name"
  type        = string
  default     = "falcon"
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "sandbox"
}

variable "cidr_block" {
  description = "CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_pri" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.0.0/18", "10.0.64.0/18"]
}

variable "cidr_pub" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.128.0/18", "10.0.192.0/18"]
}

variable "enable_dns_support" {
  description = "DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Hostname DNS support"
  type        = bool
  default     = true
}