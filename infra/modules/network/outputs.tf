# Outputs del módulo de red
# TODO(reto): Definir los outputs necesarios para que otros módulos puedan consumir los recursos de red:
# - VPC ID
# - IDs de las subnets públicas y privadas
# - IDs de los Security Groups
# - ARN del Internet Gateway
# - ARN del NAT Gateway

output "vpc_id" {
  description = "ID de la VPC"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = [] # TODO(reto): Reemplazar con los recursos reales
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = [] # TODO(reto): Reemplazar con los recursos reales
}

output "api_security_group_id" {
  description = "ID del Security Group para la API"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "rds_security_group_id" {
  description = "ID del Security Group para RDS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "ecs_security_group_id" {
  description = "ID del Security Group para ECS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}