variable "name" {
  description = "Nombre asignado a todos los recursos creados por esta plantilla"
  type        = string
  default     = null
}

variable "cidr_block_vpc" {
  description = "Bloque CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_block_pri" {
  description = "Segmentos de redes privadas"
  type        = list(string)
  default     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
}

variable "cidr_block_pub" {
  description = "Segmentos de redes publicas"
  type        = list(string)
  default     = ["10.0.96.0/19", "10.0.128.0/19", "10.0.160.0/19"]
}

variable "enable_dns_support" {
  description = "Soporte DNS"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Activar DNS Hostname"
  type        = bool
  default     = true
}