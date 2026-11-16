# Módulo de red para la aplicación móvil
# TODO(reto): Implementar los recursos de red necesarios para la aplicación móvil:
# - VPC con CIDR 10.0.0.0/16
# - Subnets públicas y privadas en al menos 2 AZs
# - Internet Gateway para las subnets públicas
# - NAT Gateway para las subnets privadas
# - Security Groups para controlar el tráfico (API, RDS, ECS)
# - Route Tables para las subnets

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks para las subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks para las subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "environment" {
  description = "Entorno (dev, prod)"
  type        = string
}