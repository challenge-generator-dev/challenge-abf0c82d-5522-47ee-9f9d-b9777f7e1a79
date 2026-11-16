# Configuración del entorno de desarrollo
# Despliega la infraestructura completa para el entorno dev

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "network" {
  source = "../../modules/network"

  environment            = "dev"
  vpc_cidr               = "10.0.0.0/16"
  public_subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs   = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "database" {
  source = "../../modules/database"

  environment            = "dev"
  vpc_id                 = module.network.vpc_id
  private_subnet_ids     = module.network.private_subnet_ids
  rds_security_group_id  = module.network.rds_security_group_id
  rds_instance_class     = "db.t3.micro"
  rds_allocated_storage  = 20
  rds_engine_version     = "15.4"
}

module "compute" {
  source = "../../modules/compute"

  environment            = "dev"
  vpc_id                 = module.network.vpc_id
  public_subnet_ids      = module.network.public_subnet_ids
  private_subnet_ids     = module.network.private_subnet_ids
  api_security_group_id  = module.network.api_security_group_id
  ecs_task_cpu           = 256
  ecs_task_memory        = 512
}

module "storage" {
  source = "../../modules/storage"

  environment            = "dev"
  vpc_id                 = module.network.vpc_id
  private_subnet_ids     = module.network.private_subnet_ids
  ecs_security_group_id  = module.network.ecs_security_group_id
}