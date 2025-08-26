# Configuraciones de Servicios

Esta carpeta contiene las configuraciones específicas para los diferentes servicios del stack MLOps.

## 📁 Estructura

```
config/
├── grafana/           # Configuración de Grafana
│   ├── dashboards/    # Dashboards predefinidos
│   ├── provisioning/  # Configuración automática
│   ├── plugins/       # Plugins instalados
│   └── ...
└── prometheus/        # Configuración de Prometheus
    └── prometheus.yml # Configuración principal
```

## 🔧 Servicios Configurados

### Grafana

- **Dashboards**: Visualizaciones predefinidas para métricas del sistema
- **Datasources**: Conexiones automáticas a Prometheus y Elasticsearch
- **Plugins**: Extensiones adicionales para funcionalidad avanzada
- **Provisioning**: Configuración automática al iniciar el contenedor

### Prometheus

- **Targets**: Endpoints de métricas a recolectar
- **Rules**: Reglas de agregación y alertas
- **Storage**: Configuración de retención de datos
- **Scrape Config**: Intervalos y configuración de recolección

## 📊 Monitoreo Configurado

### Métricas Recolectadas

- Métricas del sistema (CPU, memoria, disco)
- Métricas de contenedores Docker
- Métricas de aplicaciones (cuando estén configuradas)

### Dashboards Disponibles

- Dashboard del sistema general
- Monitoreo de contenedores
- Métricas de MLflow (cuando esté implementado)

## 🔄 Personalización

### Agregar Nuevas Métricas

1. Editar `prometheus/prometheus.yml`
2. Agregar nuevos `scrape_configs`
3. Reiniciar el contenedor de Prometheus

### Crear Nuevos Dashboards

1. Crear dashboards en la UI de Grafana
2. Exportar como JSON
3. Guardar en `grafana/dashboards/`
4. Configurar provisioning si es necesario

### Modificar Configuraciones

Las configuraciones se montan como volúmenes, por lo que los cambios requieren:

1. Modificar archivos de configuración
2. Reiniciar el servicio correspondiente
3. Verificar logs para errores

## 🚀 Próximas Configuraciones

- [ ] Alertas de Prometheus configuradas
- [ ] Dashboards específicos para MLflow
- [ ] Integración con Elasticsearch para logs
- [ ] Configuración de retention policies
- [ ] Templates de dashboards reutilizables
