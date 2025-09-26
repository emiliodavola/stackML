# StackML - Revisión Final ✅

Un stack completo de MLOps con Docker Compose que incluye servicios para experimentación, monitoreo, almacenamiento y desarrollo de modelos de machine learning.

## 🚀 Servicios Incluidos

### Servicios Principales (se levantan por defecto)

- **MLflow** (puerto 5000) - Tracking de experimentos y registro de modelos
- **MinIO** (puertos 9000/9001) - Almacenamiento de objetos compatible con S3
- **Marimo** (puerto 2718) - Notebooks interactivos modernos
- **Jupyter** (puerto 8888) - Notebooks tradicionales de Jupyter
- **RStudio** (puerto 8787) - IDE completo para R con soporte para Data Science

### Servicios On-Demand (requieren perfil específico)

- **Grafana** (puerto 3000) - Dashboards y visualización de métricas
- **Prometheus** (puerto 9090) - Recolección y almacenamiento de métricas  
- **Elasticsearch** (puerto 9200) - Búsqueda y análisis de logs
- **API** (puerto 8000) - Servicio FastAPI para servir modelos

## 🛠️ Configuración Rápida

### Inicio Rápido

#### Opción 1: Script automatizado (recomendado)

```bash
# Linux/macOS
./setup.sh

# Windows PowerShell  
.\setup.ps1
```

#### Opción 2: Configuración manual

1. **Clonar el repositorio:**

```bash
git clone https://github.com/emiliodavola/stackML.git
cd stackML
```

2. **Crear archivo de configuración:**

Copia el archivo de ejemplo y personaliza las variables:

```bash
cp .env.example .env
# Edita el archivo .env con tus configuraciones personalizadas
```

O crea un archivo `.env` manualmente usando el template de la sección [Variables de Entorno](#variables-de-entorno-env).

3. **Levantar servicios básicos:**

```bash
docker compose up -d
```

4. **Levantar todos los servicios (incluyendo on-demand):**

```bash
docker compose --profile on-demand up -d
```

5. **Acceder a los servicios:**

- MLflow: <http://localhost:5000>
- MinIO Console: <http://localhost:9001>
- Marimo: <http://localhost:2718>
- Jupyter: <http://localhost:8888>
- RStudio: <http://localhost:8787>

**Solo con perfil on-demand:**

- Grafana: <http://localhost:3000>
- Prometheus: <http://localhost:9090>
- Elasticsearch: <http://localhost:9200>
- API: <http://localhost:8000>

## 📁 Estructura del Proyecto

```
stackML/
├── .env.example           # Template de variables de entorno
├── setup.sh               # Script de configuración (Linux/macOS)
├── setup.ps1              # Script de configuración (Windows)
├── api/                   # API FastAPI para servir modelos
├── config/                # Configuraciones de servicios
│   ├── grafana/           # Configuración de Grafana
│   └── prometheus/        # Configuración de Prometheus
├── data/                  # Volúmenes de datos persistentes
├── mlflow/                # Configuración de MLflow
├── notebooks/             # Configuración de notebooks
│   ├── jupyter/           # Setup de Jupyter
│   ├── marimo/            # Setup de Marimo
│   ├── rstudio/           # Setup de RStudio
│   └── work/              # Directorio compartido de trabajo
└── docker-compose.yml     # Configuración principal
```

## 🔧 Configuración

### Variables de Entorno (.env)

Las credenciales y configuraciones están centralizadas en el archivo `.env`:

- **Puertos:** Configurables para todos los servicios
- **Credenciales:** Usuarios y contraseñas por defecto
- **Versiones:** Imágenes Docker específicas para cada servicio

#### Configuración rápida

Usa el archivo de ejemplo incluido en el repositorio:

```bash
cp .env.example .env
```

#### Template del archivo .env

Crea un archivo `.env` en la raíz del proyecto con el siguiente contenido:

```bash
# Ports - Configuración de puertos para cada servicio
MINIO_CONSOLE_PORT=9001
MINIO_PORT=9000
GRAFANA_PORT=3000
PROMETHEUS_PORT=9090
ELASTIC_PORT=9200
MLFLOW_PORT=5000
JUPYTER_PORT=8888
MARIMO_PORT=2718
API_PORT=8000
RSTUDIO_PORT=8787

# Versions - Versiones de las imágenes Docker
MINIO_IMAGE=minio/minio:latest
GRAFANA_IMAGE=grafana/grafana:latest
PROMETHEUS_IMAGE=prom/prometheus:latest
ELASTIC_IMAGE=elasticsearch:8.8.0

# Credentials - Usuarios y contraseñas (¡CAMBIAR EN PRODUCCIÓN!)
MINIO_ROOT_USER=minio
MINIO_ROOT_PASSWORD=minioadmin123
ELASTIC_USERNAME=elastic
ELASTIC_PASSWORD=elasticadmin123
GF_SECURITY_ADMIN_USER=grafana
GF_SECURITY_ADMIN_PASSWORD=grafanaadmin123
JUPYTER_PASSWORD=jupyteradmin123
MARIMO_PASSWORD=marimoadmin123
RSTUDIO_PASSWORD=rstudio

# Compose - Configuración de Docker Compose
COMPOSE_PROJECT_NAME=stackml

# Configs
RSTUDIO_DISABLE_AUTH=false
```

> ⚠️ **Importante**: Cambia todas las contraseñas antes de usar en producción.

> 💡 **Tip**: El archivo `.env.example` incluido en el repositorio contiene todas las variables necesarias con valores por defecto. Solo cópialo como `.env` y personaliza según tus necesidades.

### Datos Persistentes

Todos los datos se almacenan en la carpeta `data/` y persisten entre reinicios:

- `data/mlflow/` - Experimentos y modelos de MLflow
- `data/grafana/` - Dashboards y configuraciones
- `data/elasticsearch/` - Índices y datos
- `data/minio/` - Objetos almacenados
- `data/prometheus/` - Métricas históricas
- `data/rstudio/` - Configuraciones y datos de RStudio
- `notebooks/work/` - Notebooks compartidos

### Perfiles de Docker Compose

El proyecto utiliza perfiles para optimizar el uso de recursos:

- **Por defecto**: Solo servicios esenciales (MLflow, MinIO, Marimo, Jupyter, RStudio)
- **Perfil `on-demand`**: Servicios adicionales de monitoreo e inferencia

```bash
# Solo servicios básicos
docker compose up -d

# Todos los servicios
docker compose --profile on-demand up -d
```

## 🔄 Comandos Útiles

```bash
# Levantar solo servicios básicos
docker compose up -d

# Levantar todos los servicios (incluyendo on-demand)
docker compose --profile on-demand up -d

# Ver logs de un servicio específico
docker compose logs -f mlflow

# Detener todos los servicios
docker compose down

# Rebuild y levantar
docker compose up --build -d

# Rebuild con perfil on-demand
docker compose --profile on-demand up --build -d

# Ver estado de los contenedores
docker compose ps
```

## 🛡️ Seguridad

- **Elasticsearch** configurado con autenticación básica (user: `elastic`)
- **Grafana** con usuario administrador configurado (user: `grafana`)
- **MinIO** con credenciales personalizables (user: `minio`)
- **Jupyter** protegido con token de acceso
- **Marimo** protegido con contraseña
- Red interna Docker para comunicación entre servicios
- Todas las credenciales configurables via archivo `.env`

## 📊 Monitoreo

- **Prometheus** recolecta métricas de sistema y aplicaciones
- **Grafana** proporciona dashboards para visualización
- **Elasticsearch** almacena logs para análisis

## 🧪 Desarrollo

### Notebooks

- **Marimo**: Notebooks reactivos y modernos (recomendado)
- **Jupyter**: Notebooks tradicionales para compatibilidad

### MLflow

- Tracking automático de experimentos
- Registro de modelos centralizado
- UI web para exploración

### API

- FastAPI para deployment de modelos
- Integración con MLflow Model Registry
- Escalable y documentación automática

## 🚀 Próximos Pasos

- [ ] Dashboards predefinidos en Grafana
- [ ] Configuración de alertas en Prometheus
- [ ] Pipeline CI/CD para modelos
- [ ] Integración con herramientas de feature store
- [ ] Configuración de backup automático

## 📝 Contribución

1. Fork el proyecto
2. Crear una branch para tu feature (`git checkout -b feature/nueva-feature`)
3. Commit tus cambios (`git commit -am 'Agregar nueva feature'`)
4. Push a la branch (`git push origin feature/nueva-feature`)
5. Crear un Pull Request

## 🤖 Desarrollo Asistido

Este proyecto fue desarrollado con la asistencia de **Claude 4 Sonnet** (Anthropic), que ayudó en:

- 🏗️ **Arquitectura del stack**: Diseño de la estructura de servicios MLOps
- ⚙️ **Configuración de Docker**: Optimización de Dockerfiles y docker-compose
- 📦 **Gestión de dependencias**: Organización y actualización de requirements
- 🔧 **Perfiles on-demand**: Implementación del sistema de contenedores dinámicos
- 📚 **Documentación**: Redacción de README y mejores prácticas
- 🛡️ **Seguridad**: Configuración de autenticación y variables de entorno

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver `LICENSE` para más detalles.
