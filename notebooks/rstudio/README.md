# RStudio Server

Este servicio proporciona RStudio Server, un IDE web completo para R que incluye todas las herramientas necesarias para análisis de datos y machine learning.

## 🚀 Características

- **RStudio Server**: IDE web completo para R
- **Paquetes preinstalados**: tidyverse, caret, xgboost, plotly, shiny y más
- **Integración con Python**: Soporte para reticulate y paquetes de Python
- **Usuario configurado**: Usuario `rstudio` con password `rstudio`
- **Datos persistentes**: Los proyectos se guardan en el volumen montado

## 🌐 Acceso

Una vez levantado el contenedor, puedes acceder a:

- **RStudio Server**: [http://localhost:RSTUDIO_PORT](http://localhost:8787)

### Credenciales por defecto

- **Usuario**: `rstudio`
- **Contraseña**: `rstudio`

> ⚠️ **Importante**: Cambia la contraseña por defecto en producción.

## 📁 Estructura de Directorios

```
data/rstudio/          # Datos persistentes de RStudio
notebooks/work/        # Directorio compartido con otros notebooks
notebooks/rstudio/     # Configuración específica de RStudio
```

## 📦 Paquetes Preinstalados

### Paquetes de R

- **Tidyverse**: tidyverse, dplyr, ggplot2, readr, readxl, lubridate, stringr, forcats, purrr, tidyr
- **Data Science**: data.table, janitor, skimr, here
- **Machine Learning**: caret, randomForest, xgboost, glmnet
- **Visualización**: plotly, shiny, DT
- **Documentación**: knitr, rmarkdown
- **Desarrollo**: devtools, renv
- **Web**: httr, jsonlite, rvest
- **Python Integration**: reticulate

### Paquetes de Python

- **Análisis**: pandas, numpy
- **Visualización**: matplotlib, seaborn
- **Machine Learning**: scikit-learn
- **MLOps**: mlflow

## 🔧 Configuración

### Variables de Entorno

Las siguientes variables se configuran en el archivo `.env`:

- `RSTUDIO_PORT`: Puerto para acceder a RStudio Server (por defecto: 8787)
- `RSTUDIO_PASSWORD`: Contraseña para el usuario rstudio (opcional)

### Personalización

Para instalar paquetes adicionales de R, puedes:

1. **Via RStudio**: Usar la consola de R o el panel de paquetes
2. **Via Dockerfile**: Modificar el Dockerfile y rebuilds
3. **Via init script**: Crear un script de inicialización personalizado

## 🐳 Uso con Docker Compose

### Levantar solo RStudio

```bash
docker compose up rstudio -d
```

### Ver logs

```bash
docker compose logs rstudio
```

### Acceder al contenedor

```bash
docker compose exec rstudio bash
```

## 🔍 Integración con MLOps Stack

RStudio se integra perfectamente con el resto del stack:

- **MLflow**: Usa la librería mlflow de Python con reticulate para tracking
- **MinIO**: Accede al almacenamiento de objetos para datasets grandes
- **Shared workspace**: Comparte notebooks con Jupyter y Marimo en `notebooks/work/`

### Ejemplo de uso con MLflow

```r
library(reticulate)
mlflow <- import("mlflow")

# Configurar tracking URI
mlflow$set_tracking_uri("http://mlflow:5000")

# Iniciar experimento
mlflow$start_run()

# ... tu código de R aquí ...

# Log métricas
mlflow$log_metric("accuracy", 0.95)

# Finalizar run
mlflow$end_run()
```

## 🚀 Desarrollo y Debugging

### Instalación de paquetes durante desarrollo

Para instalar paquetes temporalmente (se perderán al recrear el contenedor):

```r
install.packages("nombre_paquete")
```

### Instalación persistente

Para que los paquetes persistan, modifica el Dockerfile:

```dockerfile
RUN R -e "install.packages('nuevo_paquete', repos='https://cran.rstudio.com/')"
```

Y reconstruye el contenedor:

```bash
docker compose build rstudio
docker compose up rstudio -d
```

## 🔒 Seguridad

- Cambia la contraseña por defecto del usuario rstudio
- Considera usar autenticación externa en producción
- Los puertos están expuestos solo localmente por defecto
- Usa HTTPS en producción