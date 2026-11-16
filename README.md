# Aprovisionamiento de Infraestructura con Terraform

Aprovisionar la infraestructura con Terraform para la aplicación móvil de pedidos. Los recursos aprovisionados deben soportar la ejecución de extremo a extremo de la aplicación.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial

**Objetivo:** Configurar el entorno de Terraform y definir los recursos básicos necesarios para la aplicación móvil.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos necesarios para la aplicación móvil.
- Configurar el entorno de Terraform.
- Definir los recursos básicos en el archivo de Terraform.

**Entregable:** Archivo de Terraform con la configuración inicial de los recursos.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de proveedores en Terraform.
- Definición de recursos en Terraform.

</details>

### Fase 2: Aprovisionamiento de Recursos

**Objetivo:** Aprovisionar los recursos necesarios para la aplicación móvil utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Aprovisionar los recursos definidos en la fase anterior.
- Verificar que los recursos se han aprovisionado correctamente.
- Documentar el proceso de aprovisionamiento.

**Entregable:** Recursos aprovisionados y documentados.

<details>
<summary>Pistas de conocimiento</summary>

- Comandos de Terraform para aprovisionar recursos.
- Verificación de recursos aprovisionados.

</details>

### Fase 3: Despliegue de la API

**Objetivo:** Desplegar la API de la aplicación móvil utilizando la infraestructura aprovisionada.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Desplegar la API en la infraestructura aprovisionada.
- Verificar que la API se ha desplegado correctamente.
- Documentar el proceso de despliegue.

**Entregable:** API desplegada y documentada.

<details>
<summary>Pistas de conocimiento</summary>

- Proceso de despliegue de aplicaciones.
- Verificación de despliegue de aplicaciones.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este reto?
- **paraQueSirve**: ¿Para qué sirve aprovisionar la infraestructura con Terraform en este contexto?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para aprovisionar los recursos necesarios para la aplicación móvil?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el aprovisionamiento de infraestructura con Terraform en este reto?

## Criterios de Evaluacion

- Configuración inicial de Terraform.
- Aprovisionamiento de recursos con Terraform.
- Despliegue de la API utilizando la infraestructura aprovisionada.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/database init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/storage init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/database validate && terraform -chdir=modules/network validate && terraform -chdir=modules/storage validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
