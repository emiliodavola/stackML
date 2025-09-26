#!/bin/bash

# StackML - Script de configuración inicial
# Este script ayuda a configurar el entorno inicial de desarrollo

echo "🚀 StackML - Configuración inicial"
echo "=================================="

# Verificar si Docker está disponible
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado. Por favor instala Docker primero."
    exit 1
fi

# Verificar si Docker Compose está disponible  
if ! command -v docker compose &> /dev/null; then
    echo "❌ Docker Compose no está disponible. Por favor instala Docker Compose primero."
    exit 1
fi

echo "✅ Docker y Docker Compose están disponibles"

# Crear archivo .env si no existe
if [ ! -f .env ]; then
    echo "📝 Creando archivo .env desde template..."
    cp .env.example .env
    echo "✅ Archivo .env creado. Puedes editarlo para personalizar la configuración."
else
    echo "ℹ️  El archivo .env ya existe. No se sobrescribirá."
fi

# Crear directorios de datos si no existen
echo "📁 Creando directorios de datos..."
mkdir -p data/{mlflow,grafana,elasticsearch,minio,prometheus,rstudio,jupyter,marimo}
echo "✅ Directorios de datos creados"

# Crear directorio de trabajo compartido
echo "📁 Creando directorio de trabajo compartido..."
mkdir -p notebooks/work
echo "✅ Directorio notebooks/work creado"

echo ""
echo "🎉 Configuración inicial completada!"
echo ""
echo "Próximos pasos:"
echo "1. Editar .env con tus configuraciones personalizadas"
echo "2. Ejecutar: docker compose up -d"
echo "3. Acceder a los servicios:"
echo "   - MLflow: http://localhost:5000"
echo "   - Jupyter: http://localhost:8888" 
echo "   - RStudio: http://localhost:8787"
echo "   - Marimo: http://localhost:2718"
echo "   - MinIO: http://localhost:9001"
echo ""
echo "Para servicios adicionales:"
echo "   docker compose --profile on-demand up -d"
echo ""