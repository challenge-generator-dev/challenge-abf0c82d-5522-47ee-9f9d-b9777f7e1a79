# Módulo de cómputo para la API de la aplicación móvil
# TODO(reto): Implementar los recursos de cómputo necesarios:
# - ECR para almacenar las imágenes de la API
# - ECS Cluster para ejecutar los servicios
# - ECS Task Definition para la API
# - ECS Service para gestionar las tareas
# - Application Load Balancer para distribuir el tráfico
# - Target Group para el ALB
# - Listener para el ALB

variable "environment" {
  description = "Entorno (dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  type        = list(string)
}

variable "api_security_group_id" {
  description = "ID del Security Group para la API"
  type        = string
}

variable "ecs_task_cpu" {
  description = "CPU para la tarea ECS"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "Memoria para la tarea ECS"
  type        = number
  default     = 512
}