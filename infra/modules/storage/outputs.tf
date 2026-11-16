# Outputs del módulo de storage
# Proporciona la información necesaria para que otros módulos consuman los recursos

# TODO(reto): Definir los outputs que otros módulos necesitan:
# 
# Output requerido por compute:
# - bucket_name: nombre del bucket S3 para que ECS pueda acceder a los assets
# - bucket_arn: ARN del bucket para políticas y permisos
# 
# Output requerido por otros módulos:
# - bucket_region: región donde está desplegado el bucket
# - bucket_domain_name: nombre de dominio del bucket para acceso via DNS
# 
# Considerar también outputs para:
# - KMS key ARN si se usa clave personalizada
# - Topic ARN para notificaciones de eventos
# - Policy ARN para acceso al bucket