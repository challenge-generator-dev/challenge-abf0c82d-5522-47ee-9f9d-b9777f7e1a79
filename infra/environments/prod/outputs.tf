# Outputs del entorno de producción

output "vpc_id" {
  description = "ID de la VPC del entorno de producción"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas del entorno de producción"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas del entorno de producción"
  value       = module.network.private_subnet_ids
}

output "alb_dns_name" {
  description = "DNS del Application Load Balancer del entorno de producción"
  value       = module.compute.alb_dns_name
}

output "ecs_cluster_arn" {
  description = "ARN del cluster ECS del entorno de producción"
  value       = module.compute.ecs_cluster_arn
}

output "ecs_service_arn" {
  description = "ARN del servicio ECS del entorno de producción"
  value       = module.compute.ecs_service_arn
}

output "ecr_repository_url" {
  description = "URL del repositorio ECR del entorno de producción"
  value       = module.compute.ecr_repository_url
}

output "rds_endpoint" {
  description = "Endpoint de la base de datos RDS del entorno de producción"
  value       = module.database.rds_endpoint
  sensitive   = true
}

output "rds_arn" {
  description = "ARN de la base de datos RDS del entorno de producción"
  value       = module.database.rds_arn
}

output "database_name" {
  description = "Nombre de la base de datos del entorno de producción"
  value       = module.database.database_name
}

output "secret_arn" {
  description = "ARN del secreto de la base de datos del entorno de producción"
  value       = module.database.secret_arn
}