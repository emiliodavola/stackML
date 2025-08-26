# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere al [Versionado Semántico](https://semver.org/lang/es/).

## [0.1.0] - 2025-08-26

### 🎉 Primera Release

Esta es la primera release oficial de **StackML**, un stack completo de MLOps con Docker Compose.

#### ✨ Agregado

- **Stack completo de servicios MLOps**:

  - MLflow para tracking de experimentos y registro de modelos
  - MinIO para almacenamiento de objetos compatible con S3
  - Grafana para dashboards y visualización de métricas
  - Prometheus para recolección y almacenamiento de métricas
  - Elasticsearch para búsqueda y análisis de logs
  - Marimo para notebooks interactivos modernos
  - Jupyter para notebooks tradicionales
  - API FastAPI para servir modelos

- **Configuración y administración**:

  - Configuración centralizada mediante archivo `.env`
  - Datos persistentes con volúmenes Docker
  - Seguridad integrada con autenticación para todos los servicios
  - Red interna Docker para comunicación segura

- **Documentación completa**:

  - README principal con guía de inicio rápido
  - Documentación específica por componente
  - Estructura de proyecto bien definida
  - Ejemplos de uso y comandos útiles

- **Herramientas de desarrollo**:

  - Notebooks dual (Jupyter + Marimo)
  - Integración completa con MLflow
  - API lista para producción
  - Entorno completamente containerizado

#### 🔧 Configuración

- Docker Compose con perfiles configurables
- Variables de entorno centralizadas
- Volúmenes persistentes para datos
- Credenciales predeterminadas seguras

#### 📋 Requisitos

- Docker y Docker Compose
- Mínimo 8GB RAM recomendado
- Puertos: 5000, 3000, 9000, 9001, 9090, 9200, 2718, 8888

#### 🔒 Credenciales por Defecto

- **Grafana**: `grafanaadmin` / `grafanaadmin`
- **MinIO**: `minioadmin` / `minioadmin`
- **Elasticsearch**: `elastic` / `elasticadmin`

[0.1.0]: https://github.com/emiliodavola/stackML/releases/tag/v0.1.0
