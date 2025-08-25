# Notebooks


Esta carpeta contiene dos subcarpetas y las imágenes para ejecutar Jupyter:

- `notebooks/marimo` - Dockerfile y contenidos para la opción `marimo`.
- `notebooks/jupyter` - Dockerfile y contenidos para la opción `jupyter`.

Comandos para levantar cada opción desde la raíz del repo:

Para levantar `marimo`:

```powershell
docker compose --profile marimo up -d marimo
```

Para levantar `jupyter`:

```powershell
docker compose --profile jupyter up -d jupyter
```

Los notebooks de usuario pueden guardarse en `notebooks/work` si quieres que sean compartidos entre ambas imágenes.
