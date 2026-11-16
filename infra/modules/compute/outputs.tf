# Outputs del módulo de cómputo
# TODO(reto): Definir los outputs necesarios para que otros módulos puedan consumir los recursos de cómputo:
# - ARN del ECS Cluster
# - ARN del ECS Service
# - URL del Application Load Balancer
# - ARN del Target Group
# - URL del ECR

output "ecs_cluster_arn" {
  description = "ARN del ECS Cluster"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "ecs_service_arn" {
  description = "ARN del ECS Service"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "alb_dns_name" {
  description = "DNS name del Application Load Balancer"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "target_group_arn" {
  description = "ARN del Target Group"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "ecr_repository_url" {
  description = "URL del repositorio ECR"
  value       = null # TODO(reto): Reemplazar con el recurso real
}