# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere al [Versionado Semántico](https://semver.org/lang/es/).

## [0.1.2] - 2025-08-29

### 🚀 Release Major: Contenedores Dinámicos y Modernización Completa

Esta release implementa mejoras transformadoras del stack MLOps con enfoque en flexibilidad, performance y seguridad.

#### ✨ Agregado

- **🔧 Sistema de Contenedores Dinámicos**:
  - Perfiles on-demand para servicios de monitoreo e inferencia
  - Optimización de recursos: solo servicios esenciales por defecto
  - Escalabilidad mejorada según necesidades del proyecto

- **📦 Ecosistema de Dependencias Expandido**:
  - Categorización temática completa (ML, NLP, Big Data, MLOps)
  - Ecosistema Nixtla completo para forecasting avanzado
  - Soporte para Transformers y herramientas modernas de NLP
  - Librerías de visualización avanzada (Bokeh, HoloViews, Datashader)
  - Herramientas de big data y computación distribuida

- **🔐 Seguridad y Configuración**:
  - Template completo del archivo .env con todas las variables
  - Autenticación robusta para Jupyter y Marimo
  - Credenciales configurables para todos los servicios
  - Variables de entorno centralizadas

- **📚 Documentación Completa**:
  - Guía de inicio rápido reorganizada
  - Sección de comandos útiles expandida
  - Documentación de perfiles y casos de uso
  - Reconocimiento de desarrollo asistido con IA
  - Mejores prácticas para producción

- **📄 Licencia MIT**: Archivo LICENSE agregado para uso libre del proyecto

#### 🐳 Mejorado

- **Modernización completa de Dockerfiles**:
  - Imagen base uv para instalaciones 10x más rápidas
  - Dependencias del sistema optimizadas para computación científica
  - Estructura estandarizada en todos los servicios
  - Mejor gestión de cache de layers

- **Configuración de servicios**:
  - Jupyter: JupyterLab por defecto, autenticación, directorio optimizado
  - Marimo: Autenticación con contraseña, directorio de trabajo correcto
  - MLflow: Instalación optimizada con uv
  - API: Estructura mejorada y dependencias optimizadas

- **Docker Compose**:
  - Perfiles para servicios on-demand vs esenciales
  - Variables de entorno para todas las configuraciones
  - Volúmenes optimizados para notebooks

#### 🔧 Reorganizado

- **Servicios por categorías**:
  - **Por defecto**: MLflow, MinIO, Marimo, Jupyter
  - **On-demand**: Grafana, Prometheus, Elasticsearch, API

- **Estructura de dependencias**:
  - requirements.txt categorizados por área funcional
  - Versiones específicas para estabilidad
  - Comentarios descriptivos para cada categoría

#### 🚀 Performance

- **Instalaciones 10x más rápidas** con imagen base uv
- **Menor uso de recursos** con perfiles dinámicos
- **Mejor cache de Docker** con estructura optimizada
- **Dependencias científicas optimizadas** para computación

#### 🛡️ Seguridad

- Autenticación completa en todos los servicios interactivos
- Variables de entorno para credenciales sensibles
- Red Docker interna para comunicación segura
- Configuración lista para producción

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
