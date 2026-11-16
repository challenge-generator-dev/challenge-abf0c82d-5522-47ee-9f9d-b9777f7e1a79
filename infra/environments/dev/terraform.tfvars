# Terraform variables for dev environment

aws_region = "us-east-1"
environment = "dev"

# Network variables
vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

# Compute variables
instance_type = "t3.micro"
ami_id = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
key_name = "dev-key-pair"
min_size = 1
max_size = 2
desired_capacity = 1

# Database variables
db_instance_class = "db.t3.micro"
db_name = "devdb"
db_username = "admin"
db_password = "securepassword123" # In real scenarios, use secrets management
allocated_storage = 20
engine_version = "15.4"
parameter_group_name = "default.postgres15"

# Storage variables
bucket_name = "dev-app-bucket"