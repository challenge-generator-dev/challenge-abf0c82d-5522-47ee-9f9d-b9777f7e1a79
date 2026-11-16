# Módulo de base de datos para la aplicación móvil
# TODO(reto): Implementar los recursos de base de datos necesarios:
# - RDS PostgreSQL con multi-AZ para alta disponibilidad
# - Subnet Group para RDS
# - Parámetros de configuración de la base de datos
# - Credenciales gestionadas con AWS Secrets Manager

variable "environment" {
  description = "Entorno (dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "ID del Security Group para RDS"
  type        = string
}

variable "rds_instance_class" {
  description = "Clase de instancia para RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Almacenamiento asignado para RDS (GB)"
  type        = number
  default     = 20
}

variable "rds_engine_version" {
  description = "Versión del motor de RDS"
  type        = string
  default     = "15.4"
}