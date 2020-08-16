variable "project" {
  description = "Nombre del proyecto"
  type        = string
  default     = "falcon"
}

variable "env" {
  description = "Nombre del ambiente"
  type        = string
  default     = "sandbox"
}

variable "cidr_block" {
  description = "Segmento CIDR de red"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_pri" {
  description = "Segmentos de red privados"
  type        = list(string)
  default     = ["10.0.0.0/18", "10.0.64.0/18"]
}

variable "cidr_pub" {
  description = "Segmentos de red publicos"
  type        = list(string)
  default     = ["10.0.128.0/18", "10.0.192.0/18"]
}

variable "enable_dns_support" {
  description = "Resolucion DNS"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Resolucion DNS para hostname"
  type        = bool
  default     = true
}