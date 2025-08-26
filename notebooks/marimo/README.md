# Marimo Notebook Configuration

Esta carpeta contiene la configuración Docker para el servicio Marimo, una alternativa moderna a Jupyter con ejecución reactiva.

## 📁 Archivos

- `Dockerfile` - Imagen personalizada de Marimo
- `requirements.txt` - Dependencias Python específicas

## 🔧 Configuración Docker

### Base Image

```dockerfile
FROM python:3.12-slim
```

### Características

- **Marimo**: Notebooks reactivos y reproducibles
- **Python 3.12**: Runtime moderno y optimizado  
- **Data Science**: pandas, numpy, scikit-learn
- **Visualization**: matplotlib, plotly, altair
- **Interactive**: Widgets nativos y reactivos

## 📦 Dependencias

### Core Libraries

```txt
# Marimo framework
marimo

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
altair
vega-lite

# MLOps
mlflow
dvc

# Database
sqlalchemy
pymongo
elasticsearch

# Utilities
requests
python-dotenv
pyyaml
fastapi
```

### Machine Learning

```txt
# Traditional ML
xgboost
lightgbm
catboost

# Deep Learning (opcional)
tensorflow
torch
transformers

# Feature Engineering
feature-engine
optuna
hyperopt
```

## 🚀 Características Marimo

### Ejecución Reactiva

- **Automática**: Células se ejecutan cuando cambian dependencias
- **Determinística**: Orden de ejecución garantizado
- **Sin estado oculto**: No hay variables escondidas
- **Reproducible**: Resultados consistentes

### Widgets Interactivos

```python
import marimo as mo

# Slider reactivo
slider = mo.ui.slider(0, 100, 50, label="Value")

# Checkbox
checkbox = mo.ui.checkbox(True, label="Enable feature")

# Text input
text_input = mo.ui.text("Enter text...", label="Input")

# Dropdown
dropdown = mo.ui.dropdown(["option1", "option2"], label="Select")
```

### Apps Web

```python
# Crear app interactiva
app = mo.App(title="ML Dashboard")

@app.cell
def data_loader():
    file_upload = mo.ui.file_upload(
        accept=[".csv", ".json"],
        multiple=False
    )
    return file_upload

@app.cell
def process_data(file_upload):
    if file_upload.value:
        df = pd.read_csv(file_upload.value[0])
        return mo.ui.table(df)
```

## 🔄 Uso y Acceso

### Acceso Web

- **URL**: <http://localhost:2718>
- **Interface**: Marimo editor moderno
- **Colaboración**: Multiplayer editing

### Directorio de Trabajo

- **Mount**: `notebooks/work/` → `/app/work`
- **Persistencia**: Archivos `.py` versionables
- **Formato**: Python scripts nativos

### Variables de Entorno

```bash
MARIMO_SERVER_PORT=2718
MLFLOW_TRACKING_URI=http://mlflow:5000
MARIMO_SERVER_HOST=0.0.0.0
```

## 🔧 Flujo de Trabajo

### Crear Notebook

```bash
# Nuevo notebook
marimo edit new_notebook.py

# Abrir existente  
marimo edit existing_notebook.py

# Tutorial interactivo
marimo tutorial intro
```

### Formato de Archivo

Los notebooks Marimo son archivos `.py` estándar:

```python
import marimo

__generated_with = "0.2.0"
app = marimo.App()

@app.cell
def __(mo):
    import pandas as pd
    import numpy as np
    return pd, np

@app.cell
def __(pd):
    df = pd.read_csv("data.csv")
    return df,
```

### Deployment

```bash
# Run como app web
marimo run notebook.py --port 8080

# Export to HTML
marimo export html notebook.py -o output.html

# Export to WASM
marimo export wasm notebook.py
```

## 📊 Integración MLOps

### MLflow Integration

```python
import marimo as mo
import mlflow

# Auto-configured tracking
mlflow.set_tracking_uri(os.getenv('MLFLOW_TRACKING_URI'))

@mo.cell
def train_model(X_train, y_train):
    with mlflow.start_run():
        model = RandomForestClassifier()
        model.fit(X_train, y_train)
        
        # Log automatically
        mlflow.log_param("n_estimators", 100)
        mlflow.sklearn.log_model(model, "model")
        
    return model
```

### Reactive Visualization

```python
@mo.cell
def interactive_plot(df, column_selector):
    # Automatically updates when df or selector changes
    fig = px.histogram(df, x=column_selector.value)
    return mo.ui.plotly(fig)
```

### Real-time Monitoring

```python
@mo.cell
def model_metrics(predictions, actuals):
    # Auto-recalculates when data changes
    accuracy = accuracy_score(actuals, predictions)
    
    # Push to Prometheus
    from prometheus_client import push_to_gateway
    
    return mo.md(f"**Accuracy**: {accuracy:.3f}")
```

## 🎯 Ventajas vs Jupyter

### Reproducibilidad

- **Sin hidden state**: Variables siempre visibles
- **Ejecución ordenada**: DAG garantizado
- **Deterministic**: Mismos inputs = mismos outputs

### Colaboración

- **Git-friendly**: Archivos .py estándar
- **Merge conflicts**: Fáciles de resolver
- **Code review**: Diff limpio

### Performance

- **Incremental**: Solo re-ejecuta lo necesario
- **Parallel**: Ejecución automática paralela
- **Memory efficient**: Garbage collection automático

### Deployment

- **Web apps**: Deploy directo como app
- **WASM**: Ejecución en browser
- **Serverless**: Compatible con funciones

## 🔧 Personalización

### Configuración

Crear `~/.marimo.toml`:

```toml
[runtime]
auto_instantiate = true
completion = "autocomplete"

[display]
theme = "dark"
code_editor_font_size = 14

[server]
port = 2718
host = "0.0.0.0"
```

### Extensiones

```python
# Custom widgets
import marimo as mo

def custom_widget():
    return mo.Html("""
    <div id="custom-widget">
        Custom interactive component
    </div>
    """)
```

### Temas y Styling

```python
# CSS personalizado
mo.Html("""
<style>
    .marimo-cell {
        background: #f0f0f0;
        border-radius: 8px;
    }
</style>
""")
```

## 🚀 Mejores Prácticas

### Estructura de Notebooks

```python
# 1. Imports al inicio
import marimo as mo
import pandas as pd

# 2. Configuration
app = mo.App(title="Analysis")

# 3. Data loading
@app.cell
def load_data():
    return pd.read_csv("data.csv")

# 4. Processing pipeline
@app.cell
def clean_data(raw_data):
    return raw_data.dropna()

# 5. Analysis/Modeling
@app.cell  
def analyze(clean_data):
    return clean_data.describe()

# 6. Visualization
@app.cell
def visualize(analysis_results):
    return mo.ui.plotly(create_plot(analysis_results))
```

### Reactive Patterns

```python
# UI Controls
@app.cell
def controls():
    file_upload = mo.ui.file_upload()
    model_selector = mo.ui.dropdown(["rf", "xgb", "lr"])
    return file_upload, model_selector

# Data Processing (reactive to controls)
@app.cell
def process(file_upload, model_selector):
    if file_upload.value:
        data = load_file(file_upload.value)
        model = create_model(model_selector.value)
        return train_model(model, data)
```

## 🔧 Troubleshooting

### Problemas Comunes

1. **Puerto ocupado**: Verificar 2718 disponible
2. **Dependencias**: Rebuildar imagen después de cambios
3. **Memory**: Ajustar límites Docker
4. **Reactive loops**: Evitar dependencias circulares

### Debug Commands

```bash
# Ver logs Marimo
docker compose logs marimo

# Restart servicio
docker compose restart marimo

# Build imagen
docker compose build marimo

# Shell interactivo
docker compose exec marimo bash
```

### Performance Tips

- **Lazy loading**: Cargar datos solo cuando necesario
- **Memoization**: Cache resultados costosos
- **Async operations**: Para IO-bound tasks
- **Batch processing**: Para datasets grandes
