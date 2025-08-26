# Configuración de Grafana

Esta carpeta contiene todos los archivos de configuración para Grafana, incluyendo dashboards, plugins y configuraciones de datasources.

## 📁 Estructura

```
grafana/
├── dashboards/        # Dashboards JSON exportados
├── plugins/           # Plugins instalados
│   ├── grafana-exploretraces-app/
│   ├── grafana-lokiexplore-app/
│   ├── grafana-metricsdrilldown-app/
│   └── grafana-pyroscope-app/
├── provisioning/      # Configuración automática
├── csv/              # Archivos CSV para datasources
├── pdf/              # Exports PDF
└── png/              # Exports PNG
```

## 🔧 Configuración

### Credenciales por Defecto

- **Usuario**: `grafanaadmin`
- **Contraseña**: `grafanaadmin`
- **Puerto**: 3000

### Plugins Preinstalados

1. **Explore Traces App** - Análisis avanzado de trazas
2. **Loki Explore App** - Exploración de logs con Loki
3. **Metrics Drilldown App** - Análisis detallado de métricas
4. **Pyroscope App** - Profiling de aplicaciones

### Datasources Configurados

Los datasources se configuran automáticamente al iniciar:

- **Prometheus** - Métricas del sistema
- **Elasticsearch** - Logs y búsquedas (cuando esté configurado)

## 📊 Dashboards

### Dashboards Disponibles

- Dashboards del sistema incluidos por defecto
- Plantillas para métricas de MLflow
- Monitoreo de contenedores Docker

### Crear Nuevos Dashboards

1. Acceder a Grafana: http://localhost:3000
2. Crear dashboard en la UI
3. Exportar como JSON
4. Guardar en la carpeta `dashboards/`

## 🔄 Personalización

### Agregar Nuevos Plugins

1. Descargar plugin en `plugins/`
2. Reiniciar el contenedor de Grafana
3. Activar en la configuración

### Configurar Alertas

1. Crear reglas de alertas en dashboards
2. Configurar canales de notificación
3. Probar alertas

### Modificar Tema

Las configuraciones visuales se pueden personalizar:

- Tema oscuro/claro por defecto
- Logos personalizados
- Colores corporativos

## 📁 Datos Persistentes

Todos los datos de Grafana se almacenan en:

- `data/grafana/` - Base de datos y configuraciones
- `config/grafana/` - Configuraciones versionadas

**Nota**: El estado persistente de Grafana (BD, plugins descargados, etc.) está ignorado por git.

## 🚀 Próximas Configuraciones

- [ ] Dashboards específicos para MLflow
- [ ] Integración con alertas de Slack/Email
- [ ] Templates reutilizables
- [ ] Configuración de LDAP/SSO
- [ ] Backup automático de dashboards
