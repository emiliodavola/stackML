# Jupyter Notebook Configuration

Esta carpeta contiene la configuración Docker para el servicio Jupyter Lab.

## 📁 Archivos

- `Dockerfile` - Imagen personalizada de Jupyter Lab
- `requirements.txt` - Dependencias Python específicas

## 🔧 Configuración Docker

### Base Image

```dockerfile
FROM jupyter/datascience-notebook:latest
```

### Características

- **Jupyter Lab**: Interfaz web moderna
- **Multi-kernel**: Python, R, Julia preinstalados
- **Data Science Stack**: pandas, numpy, scikit-learn, etc.
- **Visualization**: matplotlib, seaborn, plotly
- **Deep Learning**: tensorflow, pytorch (opcional)

## 📦 Dependencias

### Core Libraries

```txt
# MLOps
mlflow
dvc
kedro

# Data Science
pandas
numpy
scikit-learn
scipy
statsmodels

# Visualization  
matplotlib
seaborn
plotly
bokeh

# Database
sqlalchemy
pymongo
elasticsearch

# Utilities
requests
python-dotenv
pyyaml
```

### Deep Learning (Opcional)

```txt
# TensorFlow stack
tensorflow
keras
tensorboard

# PyTorch stack  
torch
torchvision
torchaudio

# Transformers
transformers
datasets
```

## 🚀 Características

### JupyterLab Extensions

- **Git integration**: Control de versiones
- **Variable inspector**: Debug variables
- **Code formatter**: black, autopep8
- **LSP**: Language server protocol
- **Widgets**: Interactividad avanzada

### Kernels Disponibles

- **Python 3**: Kernel principal
- **R**: Análisis estadístico
- **Julia**: Computing científico
- **Scala**: Big data con Spark

## 🔄 Uso y Acceso

### Acceso Web

- **URL**: <http://localhost:8888>
- **Token**: Auto-generado (ver logs)
- **Interface**: JupyterLab completo

### Directorio de Trabajo

- **Mount**: `notebooks/work/` → `/home/jovyan/work`
- **Persistencia**: Archivos persisten entre reinicios
- **Permisos**: Usuario `jovyan` (UID 1000)

### Variables de Entorno

```bash
JUPYTER_ENABLE_LAB=yes
MLFLOW_TRACKING_URI=http://mlflow:5000
GRANT_SUDO=yes
```

## 🔧 Personalización

### Agregar Dependencias

1. Editar `requirements.txt`
2. Rebuildar imagen:

```bash
docker compose build jupyter
```

### Instalar Extensiones

```bash
# Dentro del contenedor
pip install jupyterlab-git
jupyter labextension install @jupyter-widgets/jupyterlab-manager
```

### Configuración Avanzada

Crear archivo `jupyter_lab_config.py`:

```python
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 8888
c.ServerApp.open_browser = False
c.ServerApp.token = ''
c.ServerApp.password = ''
```

## 🔒 Seguridad

### Authentication

- **Token-based**: Seguro por defecto
- **Password**: Configurable
- **SSL**: Disponible para HTTPS

### Network

- **Bind**: 0.0.0.0:8888
- **Firewall**: Configurar según necesidades
- **Reverse Proxy**: Nginx/Traefik compatible

## 🚀 Mejores Prácticas

### Organización de Notebooks

```
work/
├── 01_exploration/          # EDA y análisis inicial
├── 02_preprocessing/        # Limpieza y transformación
├── 03_modeling/            # Entrenamiento de modelos
├── 04_evaluation/          # Métricas y validación
├── 05_deployment/          # Preparación para producción
├── data/                   # Datasets locales
├── models/                 # Modelos entrenados
└── utils/                  # Funciones compartidas
```

### Versionado

- **Git**: Usar `.gitignore` para checkpoints
- **DVC**: Versionar datasets grandes
- **MLflow**: Track experimentos automáticamente

### Performance

- **Memory**: Monitorear uso con `%memit`
- **Profiling**: Usar `%prun` y `%lprun`
- **Parallel**: Leverage multiprocessing/joblib

## 📊 Integración MLOps

### MLflow Tracking

```python
import mlflow
import mlflow.sklearn

# Auto-configured
mlflow.set_tracking_uri(os.getenv('MLFLOW_TRACKING_URI'))

with mlflow.start_run():
    # Your ML code here
    mlflow.log_param("n_estimators", 100)
    mlflow.log_metric("accuracy", 0.95)
    mlflow.sklearn.log_model(model, "model")
```

### Data Storage

```python
# MinIO/S3 integration
import boto3

s3 = boto3.client('s3', 
                  endpoint_url='http://minio:9000',
                  aws_access_key_id='your_key',
                  aws_secret_access_key='your_secret')
```

### Monitoring

```python
# Prometheus metrics
from prometheus_client import Counter, push_to_gateway

predictions_counter = Counter('notebook_predictions_total', 
                             'Total predictions from notebook')
```

## 🔧 Troubleshooting

### Problemas Comunes

1. **Token/Password**: Check logs con `docker compose logs jupyter`
2. **Permisos**: Verificar ownership de `work/`
3. **Memory**: Ajustar límites en compose file
4. **Extensions**: Reinstalar después de rebuild

### Debug Commands

```bash
# Ver configuración
jupyter --config-dir

# Lista kernels
jupyter kernelspec list

# Ver extensiones
jupyter labextension list

# Reset configuration
jupyter lab --generate-config
```
