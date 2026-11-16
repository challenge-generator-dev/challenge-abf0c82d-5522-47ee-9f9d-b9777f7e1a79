# Storage module for mobile app assets
# This module provisions S3 bucket for storing application assets

variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the storage resources will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for VPC endpoints"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group for ECS tasks to access S3"
  type        = string
}

# TODO(reto): Implementar la definición del bucket S3 para assets de la app móvil
# El bucket debe tener:
# - Versioning habilitado para recuperación de objetos
# - Encriptación SSE-KMS con clave gestionada por AWS
# - Lifecycle rules para transición a Glacier después de 90 días
# - Política de acceso público bloqueada
# - Etiquetas consistentes con el entorno
# 
# Consideraciones de seguridad OWASP:
# - Bloquear acceso público
# - Habilitar logging de acceso
# - Configurar lifecycle para retención de datos
# 
# Integración con otros módulos:
# - Consumir outputs de network para endpoints de VPC
# - Consumir outputs de compute para permisos de ECS
# - Proporcionar outputs para que compute/storage pueda acceder a los assets