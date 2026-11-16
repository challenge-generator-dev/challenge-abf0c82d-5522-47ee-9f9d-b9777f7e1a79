# Terraform Infrastructure for AWS

## Project Structure

```
.
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       └── outputs.tf
├── modules/
│   ├── compute/
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── database/
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── network/
│   │   ├── main.tf
│   │   └── outputs.tf
│   └── storage/
│       ├── main.tf
│       └── outputs.tf
├── providers.tf
├── variables.tf
├── versions.tf
└── README.md
```

## Prerequisites

1. Terraform >= 1.9.0 installed
2. AWS CLI configured with proper credentials
3. AWS account with permissions to create:
   - VPC
   - EC2 instances
   - RDS instances
   - S3 buckets

## Setup Instructions

### Initialize Terraform

```bash
cd environments/dev
terraform init
```

### Plan Infrastructure

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply
```

## Modules Overview

- **network**: Creates VPC, subnets, internet gateway, and route tables
- **compute**: Provisions EC2 instances and related resources
- **database**: Sets up RDS instances
- **storage**: Configures S3 buckets

## Environment Configuration

Each environment (dev/prod) has its own:
- `main.tf` (module instantiation)
- `outputs.tf` (output values)
- `terraform.tfvars` (environment-specific variables)

## Validation

After applying, verify resources in AWS Console:
1. Check VPC and subnets in VPC Dashboard
2. Verify EC2 instances in EC2 Dashboard
3. Confirm RDS instances in RDS Dashboard
4. Review S3 buckets in S3 Dashboard