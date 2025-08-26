# Configuración de MLflow

Esta carpeta contiene la configuración Docker para el servidor MLflow que gestiona el tracking de experimentos y el registro de modelos.

## 📁 Archivos

- `Dockerfile` - Imagen Docker para MLflow server
- `mlflow.db` - Base de datos SQLite (generada automáticamente)

## 🔧 Configuración

### Dockerfile

El `Dockerfile` crea una imagen personalizada basada en Python con:

- **Base**: `python:3.12-slim`
- **MLflow**: Instalado via pip
- **Puerto**: 5000 (expuesto automáticamente)
- **Comando**: `mlflow server` con configuraciones específicas

### Variables de Entorno

Configuradas en `docker-compose.yml`:

- `MLFLOW_TRACKING_URI=http://mlflow:5000`
- `MLFLOW_BACKEND_STORE_URI=sqlite:///mlflow/backend/mlflow.db`
- `MLFLOW_DEFAULT_ARTIFACT_ROOT=/mlflow/artifacts`

## 📊 Funcionalidades

### Tracking Server

MLflow proporciona:

- **Experiments**: Organización de experimentos de ML
- **Runs**: Tracking individual de entrenamientos
- **Metrics**: Registro de métricas de performance
- **Parameters**: Almacenamiento de hiperparámetros
- **Artifacts**: Gestión de modelos y archivos

### Model Registry

Sistema centralizado para:

- **Versioning**: Control de versiones de modelos
- **Staging**: Ambientes de desarrollo, staging, producción
- **Metadata**: Información descriptiva de modelos
- **Lineage**: Trazabilidad de modelos

## 🔄 Acceso y Uso

### UI Web

- **URL**: http://localhost:5000
- **Navegación**: Interfaz web completa para explorar experimentos
- **Comparación**: Herramientas para comparar runs y modelos

### API Python

```python
import mlflow

# Configurar tracking URI
mlflow.set_tracking_uri("http://localhost:5000")

# Crear experimento
mlflow.create_experiment("mi_experimento")

# Logging en runs
with mlflow.start_run():
    mlflow.log_param("lr", 0.01)
    mlflow.log_metric("accuracy", 0.95)
    mlflow.log_artifact("model.pkl")
```

### Integración con Notebooks

Los notebooks en `notebooks/work/` pueden conectarse automáticamente a MLflow usando la variable de entorno `MLFLOW_TRACKING_URI`.

## 📁 Datos Persistentes

### Backend Database

- **Ubicación**: `data/mlflow/backend/mlflow.db`
- **Tipo**: SQLite
- **Contenido**: Metadata de experimentos, runs, modelos

### Artifacts Store

- **Ubicación**: `data/mlflow/artifacts/`
- **Contenido**: 
  - Modelos serializados
  - Plots y visualizaciones
  - Datasets
  - Archivos de configuración

## 🚀 Funcionalidades Avanzadas

### Model Serving

```bash
# Servir modelo registrado
mlflow models serve -m "models:/mi_modelo/1" -p 5001

# Via REST API
curl -X POST -H "Content-Type:application/json" \
  --data '{"instances": [[1,2,3,4]]}' \
  http://localhost:5001/invocations
```

### Deployment

MLflow soporta deployment a:

- **Docker**: Containerización automática
- **Kubernetes**: Orquestación en cluster
- **Cloud**: AWS SageMaker, Azure ML, etc.

## 🔧 Personalización

### Configuración Avanzada

Para modificar la configuración:

1. Editar variables de entorno en `docker-compose.yml`
2. Agregar plugins o extensiones al `Dockerfile`
3. Configurar backend store alternativo (PostgreSQL, MySQL)

### Backup y Migración

```bash
# Backup de la base de datos
cp data/mlflow/backend/mlflow.db backup/

# Backup completo con artifacts
tar -czf mlflow-backup.tar.gz data/mlflow/
```

## 🚀 Próximas Mejoras

- [ ] Configuración de backend con PostgreSQL
- [ ] Integración con almacenamiento S3/MinIO
- [ ] Configuración de autenticación
- [ ] Scripts de backup automatizado
- [ ] Métricas para Prometheus
- [ ] Integration con CI/CD pipelines
