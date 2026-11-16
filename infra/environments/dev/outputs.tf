# Outputs del entorno de desarrollo
# Superficie de práctica: exponer outputs para verificación

# TODO(reto): Exponer los outputs relevantes del entorno de desarrollo
# - Re-exportar outputs de los módulos hijos (network, compute, database, storage)
# - Agregar outputs derivados si es necesario para el entorno de dev

# Outputs de red
output "vpc_id" {
  description = "ID de la VPC del entorno de desarrollo"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas del entorno de desarrollo"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas del entorno de desarrollo"
  value       = module.network.private_subnet_ids
}

# Outputs de compute
output "alb_dns_name" {
  description = "DNS del Application Load Balancer del entorno de desarrollo"
  value       = module.compute.alb_dns_name
}

output "ecs_cluster_arn" {
  description = "ARN del cluster ECS del entorno de desarrollo"
  value       = module.compute.ecs_cluster_arn
}

output "ecr_repository_url" {
  description = "URL del repositorio ECR del entorno de desarrollo"
  value       = module.compute.ecr_repository_url
}

# Outputs de base de datos
output "rds_endpoint" {
  description = "Endpoint de la base de datos RDS del entorno de desarrollo"
  value       = module.database.rds_endpoint
  sensitive   = true
}

output "database_name" {
  description = "Nombre de la base de datos del entorno de desarrollo"
  value       = module.database.database_name
}