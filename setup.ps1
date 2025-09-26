# StackML - Script de configuración inicial (PowerShell)
# Este script ayuda a configurar el entorno inicial de desarrollo

Write-Host "🚀 StackML - Configuración inicial" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan

# Verificar si Docker está disponible
try {
    docker --version | Out-Null
    Write-Host "✅ Docker está disponible" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker no está instalado. Por favor instala Docker primero." -ForegroundColor Red
    exit 1
}

# Verificar si Docker Compose está disponible  
try {
    docker compose version | Out-Null
    Write-Host "✅ Docker Compose está disponible" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker Compose no está disponible. Por favor instala Docker Compose primero." -ForegroundColor Red
    exit 1
}

# Crear archivo .env si no existe
if (-not (Test-Path .env)) {
    Write-Host "📝 Creando archivo .env desde template..." -ForegroundColor Yellow
    Copy-Item .env.example .env
    Write-Host "✅ Archivo .env creado. Puedes editarlo para personalizar la configuración." -ForegroundColor Green
} else {
    Write-Host "ℹ️  El archivo .env ya existe. No se sobrescribirá." -ForegroundColor Blue
}

# Crear directorios de datos si no existen
Write-Host "📁 Creando directorios de datos..." -ForegroundColor Yellow
$dataDirs = @("mlflow", "grafana", "elasticsearch", "minio", "prometheus", "rstudio", "jupyter", "marimo")
foreach ($dir in $dataDirs) {
    $path = "data\$dir"
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}
Write-Host "✅ Directorios de datos creados" -ForegroundColor Green

# Crear directorio de trabajo compartido
Write-Host "📁 Creando directorio de trabajo compartido..." -ForegroundColor Yellow
if (-not (Test-Path "notebooks\work")) {
    New-Item -ItemType Directory -Path "notebooks\work" -Force | Out-Null
}
Write-Host "✅ Directorio notebooks\work creado" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 Configuración inicial completada!" -ForegroundColor Green
Write-Host ""
Write-Host "Próximos pasos:" -ForegroundColor Cyan
Write-Host "1. Editar .env con tus configuraciones personalizadas"
Write-Host "2. Ejecutar: docker compose up -d"
Write-Host "3. Acceder a los servicios:" -ForegroundColor Yellow
Write-Host "   - MLflow: http://localhost:5000"
Write-Host "   - Jupyter: http://localhost:8888" 
Write-Host "   - RStudio: http://localhost:8787"
Write-Host "   - Marimo: http://localhost:2718"
Write-Host "   - MinIO: http://localhost:9001"
Write-Host ""
Write-Host "Para servicios adicionales:" -ForegroundColor Yellow
Write-Host "   docker compose --profile on-demand up -d"
Write-Host ""