# Notebooks

Esta carpeta contiene el entorno de notebooks para desarrollo interactivo de machine learning con múltiples opciones de interfaz.

## 📁 Estructura

```
notebooks/
├── README.md              # Esta documentación
├── jupyter/               # Configuración Jupyter Lab
│   ├── Dockerfile        # Imagen personalizada
│   └── requirements.txt  # Dependencias Python
├── marimo/               # Configuración Marimo
│   ├── Dockerfile        # Imagen personalizada  
│   └── requirements.txt  # Dependencias Python
├── rstudio/              # Configuración RStudio Server
│   ├── Dockerfile        # Imagen personalizada
│   └── requirements.txt  # Dependencias adicionales
└── work/                 # Notebooks y archivos de trabajo
```

## 🚀 Opciones de Notebooks

### Jupyter Lab

**Puerto**: 8888  
**Acceso**: <http://localhost:8888>

- **Interfaz**: Clásica y robusta para data science
- **Extensiones**: Rich ecosystem de plugins
- **Formatos**: `.ipynb`, `.py`, `.md`
- **Kernels**: Python, R, Julia, Scala
- **Widgets**: Interactividad avanzada

### Marimo

**Puerto**: 2718  
**Acceso**: <http://localhost:2718>

- **Interfaz**: Moderna y reactiva
- **Ejecución**: Automática y determinística  
- **Reproducibilidad**: Sin células ocultas
- **Deployment**: Apps web interactivas
- **Performance**: Ejecución optimizada

### RStudio Server

**Puerto**: 8787  
**Acceso**: <http://localhost:8787>

- **Interfaz**: IDE completo para R
- **Credenciales**: Usuario `rstudio` / Password `rstudio`
- **Paquetes**: Tidyverse, tidymodels, xgboost preinstalados
- **Integración**: Soporte para Python via reticulate
- **MLOps**: Conexión directa con MLflow

## 🔧 Configuración

### Variables de Entorno

Ambos servicios tienen acceso a:

```env
MLFLOW_TRACKING_URI=http://mlflow:5000
JUPYTER_ENABLE_LAB=yes
MARIMO_SERVER_PORT=2718
RSTUDIO_PORT=8787
RSTUDIO_PASSWORD=rstudio
```

### Dependencias Compartidas

Las principales librerías incluyen:

- **MLOps**: `mlflow`, `dvc`, `kedro`
- **Data Science**: `pandas`, `numpy`, `scikit-learn`
- **Deep Learning**: `tensorflow`, `pytorch`, `transformers`
- **Visualización**: `matplotlib`, `seaborn`, `plotly`
- **Database**: `sqlalchemy`, `pymongo`, `elasticsearch`

## 📊 Integración con el Stack

### MLflow Integration

```python
import mlflow

# Auto-configurado via ENV
mlflow.set_tracking_uri(os.getenv('MLFLOW_TRACKING_URI'))

# Logging automático
with mlflow.start_run():
    # Tu código de ML aquí
    mlflow.log_metrics({"accuracy": 0.95})
```

### MinIO/S3 Storage

```python
import boto3

# Cliente S3 compatible
s3_client = boto3.client(
    's3',
    endpoint_url='http://minio:9000',
    aws_access_key_id='minio_access_key',
    aws_secret_access_key='minio_secret_key'
)
```

### Elasticsearch Analytics

```python
from elasticsearch import Elasticsearch

# Cliente Elasticsearch
es = Elasticsearch([{'host': 'elasticsearch', 'port': 9200}])
```

### Prometheus Metrics

```python
from prometheus_client import Counter, Histogram, push_to_gateway

# Métricas personalizadas
model_predictions = Counter('ml_predictions_total', 'Total predictions')
```

## 📁 Workspace Persistente

### Directorio de Trabajo

- **Ubicación**: `notebooks/work/`
- **Persistencia**: Montado como volumen Docker
- **Acceso**: Compartido entre Jupyter y Marimo
- **Contenido**: 
  - Notebooks de desarrollo
  - Datasets de experimentación
  - Scripts Python
  - Modelos temporales

### Ejemplos Incluidos

El workspace incluirá ejemplos de:

- **Data Exploration**: Análisis exploratorio con visualizaciones
- **Model Training**: Pipelines de entrenamiento con MLflow
- **Model Evaluation**: Métricas y validación cruzada
- **Feature Engineering**: Transformaciones y selección
- **Deployment Prep**: Preparación para producción

## 🔄 Flujo de Trabajo Recomendado

### 1. Desarrollo Exploratorio

- **Herramienta**: Jupyter Lab
- **Actividad**: EDA, prototipado rápido, visualizaciones
- **Output**: Notebooks `.ipynb` documentados

### 2. Código Productivo

- **Herramienta**: Marimo
- **Actividad**: Código limpio, apps interactivas
- **Output**: Scripts `.py` reproducibles

### 3. Tracking de Experimentos

- **Integración**: MLflow automático
- **Métricas**: Logged en cada experimento
- **Artifacts**: Modelos y plots guardados

### 4. Data Pipeline

- **Storage**: MinIO para datasets grandes
- **Processing**: Distributed con Dask/Ray
- **Monitoring**: Métricas en Prometheus/Grafana

## 🚀 Extensiones y Personalización

### Jupyter Extensions

```bash
# Instalar extensiones populares
pip install jupyterlab-git
pip install jupyterlab-lsp
pip install jupyterlab-variableinspector
```

### Marimo Apps

```python
import marimo as mo

# App reactiva
app = mo.App()

@app.cell
def data_input():
    slider = mo.ui.slider(0, 100, 50)
    return slider

@app.cell  
def process_data(slider):
    result = slider.value * 2
    return mo.md(f"Result: {result}")
```

### Custom Kernels

Agregar kernels adicionales:

```bash
# R kernel
conda install r-irkernel

# Julia kernel  
julia -e 'using Pkg; Pkg.add("IJulia")'
```

## 🔒 Seguridad y Acceso

### Jupyter Authentication

- **Token**: Generado automáticamente
- **Password**: Configurable via ENV
- **SSL**: Opcional para HTTPS

### Network Access

- **Internal**: Comunicación entre servicios
- **External**: Puertos 8888 y 2718 expuestos
- **Firewall**: Configurar según necesidades

## 📚 Recursos y Documentación

### Jupyter

- [Documentación oficial](https://jupyter.org/)
- [JupyterLab extensions](https://jupyterlab.readthedocs.io/)
- [Jupyter widgets](https://ipywidgets.readthedocs.io/)

### Marimo

- [Documentación oficial](https://marimo.io/)
- [Tutorial interactivo](https://marimo.io/tutorial)
- [Community examples](https://github.com/marimo-team/marimo)

## 🔧 Troubleshooting

### Problemas Comunes

1. **Puerto ocupado**: Verificar procesos en 8888/2718
2. **Dependencias faltantes**: Rebuildar imagen Docker
3. **Memoria insuficiente**: Ajustar límites en compose
4. **Permisos**: Verificar ownership del directorio work/

### Logs y Debugging

```bash
# Ver logs de Jupyter
docker compose logs jupyter

# Ver logs de Marimo  
docker compose logs marimo

# Restart servicios
docker compose restart jupyter marimo
```

Los notebooks de usuario pueden guardarse en `notebooks/work` si quieres que sean compartidos entre ambas imágenes.
