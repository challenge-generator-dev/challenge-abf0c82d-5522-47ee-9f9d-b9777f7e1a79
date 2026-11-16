# Outputs del módulo de base de datos
# TODO(reto): Definir los outputs necesarios para que otros módulos puedan consumir los recursos de base de datos:
# - Endpoint de la base de datos
# - ARN de la instancia RDS
# - Nombre de la base de datos
# - ARN del secreto en Secrets Manager

output "rds_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "rds_arn" {
  description = "ARN de la instancia RDS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "secret_arn" {
  description = "ARN del secreto en AWS Secrets Manager"
  value       = null # TODO(reto): Reemplazar con el recurso real
}