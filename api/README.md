# API para Servir Modelos

Esta carpeta contiene una API FastAPI para servir modelos de Machine Learning registrados en MLflow.

## 📁 Contenido

- `Dockerfile` - Imagen Docker para la API
- `server.py` - Servidor FastAPI principal
- `requirements.txt` - Dependencias Python

## 🚀 Funcionalidades

### Endpoints Disponibles

- `GET /` - Health check de la API
- `GET /docs` - Documentación automática de la API (Swagger UI)
- `POST /predict` - Endpoint para realizar predicciones (cuando se implemente)

### Características

- **FastAPI**: Framework moderno y rápido para APIs
- **Integración MLflow**: Carga modelos desde el Model Registry
- **Documentación automática**: Swagger UI incluido
- **Contenedorizado**: Listo para deployment con Docker

## 🛠️ Uso

### Levantar la API

```bash
# Desde el directorio raíz del proyecto
docker compose --profile on-demand up api -d
```

### Acceder a la API

- **API Base**: http://localhost:8000
- **Documentación**: http://localhost:8000/docs
- **Health Check**: http://localhost:8000

### Desarrollo Local

```bash
# Instalar dependencias
pip install -r requirements.txt

# Ejecutar localmente
uvicorn server:app --reload --port 8000
```

## 🔧 Configuración

### Variables de Entorno

- `MLFLOW_TRACKING_URI` - URL del servidor MLflow (configurado automáticamente)

### Personalización

Para agregar nuevos endpoints o modificar el comportamiento:

1. Editar `server.py`
2. Actualizar `requirements.txt` si es necesario
3. Rebuild la imagen: `docker compose build api`

## 📊 Integración con MLflow

La API está configurada para:

- Conectarse automáticamente al servidor MLflow
- Cargar modelos desde el Model Registry
- Servir predicciones usando modelos registrados

## 🔮 Próximas Funcionalidades

- [ ] Endpoint de predicción completamente funcional
- [ ] Carga dinámica de modelos
- [ ] Logging de requests y respuestas
- [ ] Métricas de performance
- [ ] Autenticación y autorización
- [ ] Rate limiting
- [ ] Versionado de modelos automático
