FROM ghcr.io/astral-sh/uv:python3.11-bookworm-slim

# Install system dependencies for scientific computing and Git
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install MLflow and dependencies with uv (much faster than pip)
RUN UV_HTTP_TIMEOUT=300 uv pip install --system --no-cache --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org mlflow[extras] boto3

COPY . /app

EXPOSE 5000

CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
