# stackML (propuesta de nombre)

Este repositorio contiene un docker-compose versionado para levantar servicios comunes de MLOps: mlflow, minio, grafana, prometheus, notebooks (opciones `marimo` o `jupyter`), elasticsearch y una API para servir modelos on-demand.

Nombre propuesto: `stackML` — corto, descriptivo y orientado a una pila completa (stack) para ML. Alternativas: `mlStack`, `mlops-stack`.

Git flow

- Usa git-flow: ramas `develop`, `release/*`, `feature/*`, `hotfix/*`, `main`.

- Para agregar una feature: crear `feature/<nombre>` desde `develop`, hacer commits, luego merge a `develop`.

Docker Compose

- Servicios por defecto: minio, prometheus, grafana, elasticsearch, mlflow, marimo.

- API está en el perfil `on-demand` y se levanta con: `docker compose --profile on-demand up api`.

Archivos creados:

- `docker-compose.yml` - compose principal con perfiles.

- `mlflow/Dockerfile` - imagen para mlflow server.

- `notebooks/Dockerfile` - imagen con jupyter (opción `marimo`).

- `api/Dockerfile`, `api/server.py` - API FastAPI minimal.

- `config/prometheus/prometheus.yml` - config prometheus.

Próximos pasos y mejoras:

- Añadir dashboards Grafana y datasources.

- Configurar Elasticsearch y conexiones seguras.

- Añadir tests y CI para builds.
