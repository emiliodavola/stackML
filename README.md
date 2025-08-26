# StackML - Revisión Final ✅

Un stack completo de MLOps con Docker Compose que incluye servicios para experimentación, monitoreo, almacenamiento y desarrollo de modelos de machine learning.

## 🚀 Servicios Incluidos

### Servicios Principales (se levantan por defecto)

- **MLflow** (puerto 5000) - Tracking de experimentos y registro de modelos
- **MinIO** (puertos 9000/9001) - Almacenamiento de objetos compatible con S3
- **Grafana** (puerto 3000) - Dashboards y visualización de métricas
- **Prometheus** (puerto 9090) - Recolección y almacenamiento de métricas
- **Elasticsearch** (puerto 9200) - Búsqueda y análisis de logs
- **Marimo** (puerto 2718) - Notebooks interactivos modernos
- **Jupyter** (puerto 8888) - Notebooks tradicionales de Jupyter
- **API** - Servicio FastAPI para servir modelos (perfil `on-demand`)

## 🛠️ Configuración Rápida

### Prerrequisitos

- Docker y Docker Compose
- Mínimo 8GB RAM recomendado

### Inicio Rápido

1. **Clonar el repositorio:**

```bash
git clone <repository-url>
cd stackML
```

2. **Levantar todos los servicios:**

```bash
docker compose up -d
```

3. **Acceder a los servicios:**

- MLflow: http://localhost:5000
- Grafana: http://localhost:3000 (admin: `grafanaadmin` / `grafanaadmin`)
- MinIO Console: http://localhost:9001 (admin: `minioadmin` / `minioadmin`)
- Prometheus: http://localhost:9090
- Elasticsearch: http://localhost:9200 (admin: `elastic` / `elasticadmin`)
- Marimo: http://localhost:2718
- Jupyter: http://localhost:8888

## 📁 Estructura del Proyecto

```
stackML/
├── api/                    # API FastAPI para servir modelos
├── config/                 # Configuraciones de servicios
│   ├── grafana/           # Configuración de Grafana
│   └── prometheus/        # Configuración de Prometheus
├── data/                  # Volúmenes de datos persistentes
├── mlflow/                # Configuración de MLflow
├── notebooks/             # Configuración de notebooks
│   ├── jupyter/           # Setup de Jupyter
│   ├── marimo/            # Setup de Marimo
│   └── work/              # Directorio compartido de trabajo
├── docker-compose.yml     # Configuración principal
└── .env                   # Variables de entorno
```

## 🔧 Configuración

### Variables de Entorno (.env)

Las credenciales y configuraciones están centralizadas en el archivo `.env`:

- **Puertos:** Configurables para todos los servicios
- **Credenciales:** Usuarios y contraseñas por defecto
- **Versiones:** Imágenes Docker específicas para cada servicio

### Datos Persistentes

Todos los datos se almacenan en la carpeta `data/` y persisten entre reinicios:

- `data/mlflow/` - Experimentos y modelos de MLflow
- `data/grafana/` - Dashboards y configuraciones
- `data/elasticsearch/` - Índices y datos
- `data/minio/` - Objetos almacenados
- `data/prometheus/` - Métricas históricas
- `notebooks/work/` - Notebooks compartidos

## 🔄 Comandos Útiles

```bash
# Levantar todos los servicios
docker compose up -d

# Ver logs de un servicio específico
docker compose logs -f mlflow

# Detener todos los servicios
docker compose down

# Rebuild y levantar
docker compose up --build -d

# Ver estado de los contenedores
docker compose ps
```

## 🛡️ Seguridad

- Elasticsearch configurado con autenticación básica
- Grafana con usuario administrador configurado
- MinIO con credenciales personalizables
- Red interna Docker para comunicación entre servicios

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

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver `LICENSE` para más detalles.
