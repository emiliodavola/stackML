# Configuración de Prometheus

Esta carpeta contiene la configuración principal de Prometheus para la recolección de métricas del sistema y aplicaciones.

## 📁 Archivos

- `prometheus.yml` - Configuración principal de Prometheus

## 🔧 Configuración Actual

### Targets Configurados

El archivo `prometheus.yml` define qué endpoints monitorear:

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
```

### Métricas Recolectadas

**Prometheus Self-Monitoring**:

- Métricas del propio servidor Prometheus
- Estado de health checks
- Performance de queries

## 📊 Expansión de Monitoreo

### Agregar Nuevos Targets

Para monitorear servicios adicionales, editar `prometheus.yml`:

```yaml
scrape_configs:
  - job_name: 'mlflow'
    static_configs:
      - targets: ['mlflow:5000']
    metrics_path: '/metrics'
    
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node-exporter:9100']
```

### Servicios Recomendados para Monitorear

1. **MLflow Server** - Métricas de experimentos
2. **Node Exporter** - Métricas del sistema operativo
3. **cAdvisor** - Métricas de contenedores Docker
4. **API FastAPI** - Métricas de aplicación personalizada

## 🔄 Configuración de Alertas

### Rules Files

Para configurar alertas, crear archivos de reglas:

```yaml
# En prometheus.yml
rule_files:
  - "alert_rules.yml"
```

### Ejemplos de Alertas

```yaml
# alert_rules.yml
groups:
  - name: mlflow_alerts
    rules:
      - alert: MLflowDown
        expr: up{job="mlflow"} == 0
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "MLflow server is down"
```

## 📁 Datos Persistentes

- **Configuración**: `config/prometheus/prometheus.yml`
- **Datos de tiempo**: `data/prometheus/`
- **Retención**: Configurada en `docker-compose.yml`

## 🚀 Próximas Configuraciones

- [ ] Agregar node-exporter para métricas del sistema
- [ ] Configurar cAdvisor para métricas de contenedores
- [ ] Integrar métricas de MLflow
- [ ] Configurar alertas básicas
- [ ] Agregar recording rules para optimización
- [ ] Configurar federation si es necesario

## 📖 Referencias

- [Documentación de Prometheus](https://prometheus.io/docs/)
- [Ejemplos de configuración](https://github.com/prometheus/prometheus/tree/main/config)
- [Alerting rules](https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/)
