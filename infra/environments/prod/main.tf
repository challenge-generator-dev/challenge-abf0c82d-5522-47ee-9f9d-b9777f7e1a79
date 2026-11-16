# Configuración del entorno de producción
# Despliega la infraestructura completa para el entorno prod

locals {
  environment = "prod"
}

module "network" {
  source = "../../modules/network"

  environment           = local.environment
  vpc_cidr              = "10.1.0.0/16"
  public_subnet_cidrs   = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnet_cidrs  = ["10.1.3.0/24", "10.1.4.0/24"]
}

module "database" {
  source = "../../modules/database"

  environment            = local.environment
  vpc_id                 = module.network.vpc_id
  private_subnet_ids     = module.network.private_subnet_ids
  rds_security_group_id  = module.network.rds_security_group_id
  rds_instance_class     = "db.t3.medium"
  rds_allocated_storage  = 50
}

module "compute" {
  source = "../../modules/compute"

  environment         = local.environment
  vpc_id              = module.network.vpc_id
  public_subnet_ids   = module.network.public_subnet_ids
  private_subnet_ids  = module.network.private_subnet_ids
  api_security_group_id = module.network.api_security_group_id
  ecs_task_cpu        = 512
  ecs_task_memory     = 1024
}

module "storage" {
  source = "../../modules/storage"

  environment            = local.environment
  vpc_id                 = module.network.vpc_id
  private_subnet_ids     = module.network.private_subnet_ids
  ecs_security_group_id  = module.network.ecs_security_group_id
}