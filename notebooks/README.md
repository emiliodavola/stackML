# Notebooks

Esta carpeta contiene los notebooks y la imagen para ejecutar Jupyter.

Opciones disponibles desde `docker-compose`:

- `marimo` (profile: `marimo`): imagen ligera con Jupyter y configuraciones de experimentación (equivalente al antiguo "marimo").
- `jupyter` (profile: `jupyter` o `dev`): imagen oficial basada en `python:3.12-slim` o imagen de Jupyter (según configuración en `docker-compose.yml`).

Para levantar la opción `marimo`:

```powershell
docker compose --profile marimo up -d marimo
```

Para levantar la opción `jupyter` (dev):

```powershell
docker compose --profile dev up -d jupyter
```
