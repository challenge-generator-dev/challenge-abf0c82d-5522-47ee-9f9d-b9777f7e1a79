# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/storage/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/storage/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/database init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/storage init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/database validate && terraform -chdir=modules/network validate && terraform -chdir=modules/storage validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `client` expone http (api: http://${alb_dns_name}):
  - `GET /orders`
  - `POST /orders`

## Referencias no verificadas

Referencias no verificadas para: .dart. El analisis estatico no cubre esos lenguajes: que no se haya listado nada NO garantiza que no haya referencias colgando.

## Como saber que terminaste

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/database init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/storage init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/database validate && terraform -chdir=modules/network validate && terraform -chdir=modules/storage validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil, Aprovisiona con Terraform los recursos que consume la aplicacion movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Aprovisionamiento de Infraestructura con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial — objetivo: Configurar el entorno de Terraform y definir los recursos básicos necesarios para la aplicación móvil. — entregable (NO resolver): Archivo de Terraform con la configuración inicial de los recursos.
- Fase 2: Aprovisionamiento de Recursos — objetivo: Aprovisionar los recursos necesarios para la aplicación móvil utilizando Terraform. — entregable (NO resolver): Recursos aprovisionados y documentados.
- Fase 3: Despliegue de la API — objetivo: Desplegar la API de la aplicación móvil utilizando la infraestructura aprovisionada. — entregable (NO resolver): API desplegada y documentada.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/variables.tf ===
variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, prod, etc.)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_instance_class" {
  description = "Database instance class"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: infra/providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: infra/modules/network/main.tf ===
# Módulo de red para la aplicación móvil
# TODO(reto): Implementar los recursos de red necesarios para la aplicación móvil:
# - VPC con CIDR 10.0.0.0/16
# - Subnets públicas y privadas en al menos 2 AZs
# - Internet Gateway para las subnets públicas
# - NAT Gateway para las subnets privadas
# - Security Groups para controlar el tráfico (API, RDS, ECS)
# - Route Tables para las subnets

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks para las subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks para las subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "environment" {
  description = "Entorno (dev, prod)"
  type        = string
}

// === ARCHIVO: infra/modules/network/outputs.tf ===
# Outputs del módulo de red
# TODO(reto): Definir los outputs necesarios para que otros módulos puedan consumir los recursos de red:
# - VPC ID
# - IDs de las subnets públicas y privadas
# - IDs de los Security Groups
# - ARN del Internet Gateway
# - ARN del NAT Gateway

output "vpc_id" {
  description = "ID de la VPC"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = [] # TODO(reto): Reemplazar con los recursos reales
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = [] # TODO(reto): Reemplazar con los recursos reales
}

output "api_security_group_id" {
  description = "ID del Security Group para la API"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "rds_security_group_id" {
  description = "ID del Security Group para RDS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "ecs_security_group_id" {
  description = "ID del Security Group para ECS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

// === ARCHIVO: infra/modules/compute/main.tf ===
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

// === ARCHIVO: infra/modules/compute/outputs.tf ===
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

// === ARCHIVO: infra/modules/database/main.tf ===
# Módulo de base de datos para la aplicación móvil
# TODO(reto): Implementar los recursos de base de datos necesarios:
# - RDS PostgreSQL con multi-AZ para alta disponibilidad
# - Subnet Group para RDS
# - Parámetros de configuración de la base de datos
# - Credenciales gestionadas con AWS Secrets Manager

variable "environment" {
  description = "Entorno (dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "ID del Security Group para RDS"
  type        = string
}

variable "rds_instance_class" {
  description = "Clase de instancia para RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Almacenamiento asignado para RDS (GB)"
  type        = number
  default     = 20
}

variable "rds_engine_version" {
  description = "Versión del motor de RDS"
  type        = string
  default     = "15.4"
}

// === ARCHIVO: infra/modules/database/outputs.tf ===
# Outputs del módulo de base de datos
# TODO(reto): Definir los outputs necesarios para que otros módulos puedan consumir los recursos de base de datos:
# - Endpoint de la base de datos
# - ARN de la instancia RDS
# - Nombre de la base de datos
# - ARN del secreto en Secrets Manager

output "rds_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "rds_arn" {
  description = "ARN de la instancia RDS"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

output "secret_arn" {
  description = "ARN del secreto en AWS Secrets Manager"
  value       = null # TODO(reto): Reemplazar con el recurso real
}

// === ARCHIVO: infra/modules/storage/main.tf ===
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

// === ARCHIVO: infra/modules/storage/outputs.tf ===
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

// === ARCHIVO: infra/environments/dev/main.tf ===
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

// === ARCHIVO: infra/environments/prod/main.tf ===
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

// === ARCHIVO: infra/environments/dev/outputs.tf ===
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

// === ARCHIVO: infra/environments/prod/outputs.tf ===
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

// === ARCHIVO: client/lib/main.dart ===
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/datasources/remote/order_api_client.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/usecases/get_orders.dart';
import 'presentation/screens/orders_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    
    final orderApiClient = OrderApiClient(dio);
    final orderRepository = OrderRepositoryImpl(
      apiClient: orderApiClient,
    );
    final getOrders = GetOrders(orderRepository);

    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OrdersScreen(getOrders: getOrders),
    );
  }
}

// === ARCHIVO: client/pubspec.yaml ===
name: reto
description: Reto de aprendizaje.
publish_to: none
version: 1.0.0+1

environment:
  sdk: ">=3.12.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  dio: 5.11.1
  flutter_riverpod: 3.5.0

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

// === ARCHIVO: client/analysis_options.yaml ===
analyzer:
  exclude:
    - _pendiente/**

// === ARCHIVO: client/lib/domain/entities/order.dart ===
import 'package:flutter/foundation.dart';

@immutable
class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double total;
  final String status;
  final String createdAt;

  const Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  Order copyWith({
    String? id,
    String? userId,
    List<OrderItem>? items,
    double? total,
    String? status,
    String? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      total: total ?? this.total,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    final order = Order(
      id: json['id'] as String,
      userId: json['userId'] as String,
      items: (json['items'] as List)
          .map((itemJson) => OrderItem.fromJson(itemJson as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );
    order._validate();
    return order;
  }

  void _validate() {
    assert(id.isNotEmpty, 'Order ID cannot be empty');
    assert(userId.isNotEmpty, 'User ID cannot be empty');
    assert(items.isNotEmpty, 'Order must have at least one item');
    assert(total > 0, 'Total must be greater than zero');
    assert(status.isNotEmpty, 'Status cannot be empty');
    assert(createdAt.isNotEmpty, 'CreatedAt cannot be empty');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order &&
        other.id == id &&
        other.userId == userId &&
        other.total == total &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(id, userId, total, status, createdAt);
  }

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, items: ${items.length}, total: $total, status: $status, createdAt: $createdAt)';
  }
}

@immutable
class OrderItem {
  final String productId;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    final item = OrderItem(
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
    item._validate();
    return item;
  }

  void _validate() {
    assert(productId.isNotEmpty, 'Product ID cannot be empty');
    assert(quantity > 0, 'Quantity must be greater than zero');
    assert(price > 0, 'Price must be greater than zero');
  }

  double get subtotal => quantity * price;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderItem &&
        other.productId == productId &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return Object.hash(productId, quantity, price);
  }

  @override
  String toString() {
    return 'OrderItem(productId: $productId, quantity: $quantity, price: $price)';
  }
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> createOrder(Order order);

  /// Validates the order data before sending it to the API.
  /// Throws [ArgumentError] if the order is invalid.
  void validateOrder(Order order) {
    if (order.id.isEmpty) {
      throw ArgumentError('Order ID cannot be empty');
    }
    if (order.userId.isEmpty) {
      throw ArgumentError('User ID cannot be empty');
    }
    if (order.items.isEmpty) {
      throw ArgumentError('Order must have at least one item');
    }
    if (order.total <= 0) {
      throw ArgumentError('Total must be greater than zero');
    }
    if (order.status.isEmpty) {
      throw ArgumentError('Status cannot be empty');
    }
    if (order.createdAt.isEmpty) {
      throw ArgumentError('CreatedAt cannot be empty');
    }
    for (final item in order.items) {
      if (item.productId.isEmpty) {
        throw ArgumentError('Product ID cannot be empty');
      }
      if (item.quantity <= 0) {
        throw ArgumentError('Quantity must be greater than zero');
      }
      if (item.price <= 0) {
        throw ArgumentError('Price must be greater than zero');
      }
    }
  }
}

// === ARCHIVO: client/lib/domain/usecases/get_orders.dart ===
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository orderRepository;

  GetOrders(this.orderRepository);

  Future<List<Order>> call() async {
    try {
      final orders = await orderRepository.getOrders();
      return orders;
    } catch (e) {
      // Log the error for debugging purposes
      print('Error fetching orders: $e');
      // Re-throw the exception to be handled by the presentation layer
      throw Exception('Failed to fetch orders: $e');
    }
  }
}

// === ARCHIVO: client/lib/data/datasources/remote/order_api_client.dart ===
import 'package:dio/dio.dart';
import '../../../domain/entities/order.dart';
import '../../../core/constants/api_constants.dart';

class OrderApiClient {
  final Dio dio;

  OrderApiClient(this.dio);

  Future<List<Order>> getOrders() async {
    try {
      final response = await dio.get(ApiConstants.ordersEndpoint);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Order.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load orders: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error fetching orders: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error fetching orders: $e');
    }
  }

  Future<Order> createOrder(Order order) async {
    try {
      final response = await dio.post(
        ApiConstants.ordersEndpoint,
        data: order.toJson(),
      );
      if (response.statusCode == 201) {
        return Order.fromJson(response.data);
      } else {
        throw Exception('Failed to create order: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error creating order: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error creating order: $e');
    }
  }
}

// === ARCHIVO: client/lib/core/constants/api_constants.dart ===
class ApiConstants {
  static const String baseUrl = 'http://${String.fromEnvironment('ALB_DNS_NAME')}';
  static const String ordersEndpoint = '$baseUrl/orders';

  // Timeout settings
  static const Duration connectTimeout = Duration(seconds: 5);
  static const Duration receiveTimeout = Duration(seconds: 10);

  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Error messages
  static const String networkErrorMessage = 'Network error. Please check your connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String invalidResponseMessage = 'Invalid response from server.';
}

// === ARCHIVO: client/lib/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <application
        android:label="reto"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="true">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/remote/order_api_client.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApiClient _apiClient;

  OrderRepositoryImpl({
    required OrderApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<Order>> getOrders() async {
    try {
      final orders = await _apiClient.getOrders();
      return orders;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Unexpected error while fetching orders: $e');
    }
  }

  @override
  Future<Order> createOrder(Order order) async {
    try {
      validateOrder(order);
      final createdOrder = await _apiClient.createOrder(order);
      return createdOrder;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is ArgumentError) {
        rethrow;
      }
      throw Exception('Unexpected error while creating order: $e');
    }
  }

  @override
  void validateOrder(Order order) {
    if (order.userId.isEmpty) {
      throw ArgumentError('User ID cannot be empty');
    }
    if (order.items.isEmpty) {
      throw ArgumentError('Order must have at least one item');
    }
    if (order.total <= 0) {
      throw ArgumentError('Total must be greater than zero');
    }
    if (order.status.isEmpty) {
      throw ArgumentError('Status cannot be empty');
    }
    if (order.createdAt.isEmpty) {
      throw ArgumentError('CreatedAt cannot be empty');
    }
    for (final item in order.items) {
      if (item.productId.isEmpty) {
        throw ArgumentError('Product ID cannot be empty');
      }
      if (item.quantity <= 0) {
        throw ArgumentError('Quantity must be greater than zero');
      }
      if (item.price <= 0) {
        throw ArgumentError('Price must be greater than zero');
      }
    }
  }

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      case DioExceptionType.connectionError:
        return Exception('No internet connection. Please check your network settings.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Unknown error';
        if (statusCode == 400) {
          return Exception('Bad request: $message');
        } else if (statusCode == 401) {
          return Exception('Unauthorized. Please log in again.');
        } else if (statusCode == 403) {
          return Exception('Forbidden. You do not have permission.');
        } else if (statusCode == 404) {
          return Exception('Resource not found.');
        } else if (statusCode == 500) {
          return Exception('Server error. Please try again later.');
        }
        return Exception('Server error: $statusCode - $message');
      case DioExceptionType.cancel:
        return Exception('Request was cancelled.');
      default:
        return Exception('Network error occurred. Please try again.');
    }
  }
}

// === ARCHIVO: client/lib/presentation/screens/orders_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/order.dart';
import '../../domain/usecases/get_orders.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  final GetOrders getOrders;

  const OrdersScreen({
    super.key,
    required this.getOrders,
  });

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  late Future<List<Order>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() {
    _ordersFuture = widget.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _loadOrders();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Order>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          }

          final orders = snapshot.data ?? [];

          if (orders.isEmpty) {
            return _buildEmptyState();
          }

          return _buildOrdersList(orders);
        },
      ),
    );
  }

  Widget _buildErrorWidget(String errorMessage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading orders',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  _loadOrders();
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No orders yet',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Your orders will appear here once you make a purchase.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(List<Order> orders) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _OrderCard(order: order);
      },
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order.id.substring(0, 8)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                _StatusChip(status: order.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Items: ${order.items.length}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Total: \$${order.total.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User: ${order.userId}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                Text(
                  _formatDate(order.createdAt),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = _getStatusInfo(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  (Color, String) _getStatusInfo(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return (Colors.orange, 'Pending');
      case 'processing':
        return (Colors.blue, 'Processing');
      case 'shipped':
        return (Colors.purple, 'Shipped');
      case 'delivered':
        return (Colors.green, 'Delivered');
      case 'cancelled':
        return (Colors.red, 'Cancelled');
      default:
        return (Colors.grey, status);
    }
  }
}

// === ARCHIVO: client/lib/data/domain/entities/order.dart ===
class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double total;
  final String status;
  final String createdAt;

  const Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  Order copyWith({
    String? id,
    String? userId,
    List<OrderItem>? items,
    double? total,
    String? status,
    String? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      total: total ?? this.total,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    final order = Order(
      id: json['id'] as String,
      userId: json['userId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );
    order._validate();
    return order;
  }

  void _validate() {
    assert(userId.isNotEmpty, 'User ID cannot be empty');
    assert(items.isNotEmpty, 'Order must have at least one item');
    assert(total > 0, 'Total must be greater than zero');
    assert(status.isNotEmpty, 'Status cannot be empty');
    assert(createdAt.isNotEmpty, 'CreatedAt cannot be empty');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order &&
        other.id == id &&
        other.userId == userId &&
        other.total == total &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(id, userId, total, status, createdAt);
  }

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, items: ${items.length}, total: $total, status: $status, createdAt: $createdAt)';
  }
}

class OrderItem {
  final String productId;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    final item = OrderItem(
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
    item._validate();
    return item;
  }

  void _validate() {
    assert(quantity > 0, 'Quantity must be greater than zero');
    assert(price > 0, 'Price must be greater than zero');
  }

  double get subtotal => quantity * price;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderItem &&
        other.productId == productId &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return Object.hash(productId, quantity, price);
  }

  @override
  String toString() {
    return 'OrderItem(productId: $productId, quantity: $quantity, price: $price)';
  }
}
```
