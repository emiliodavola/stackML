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

# Create app directory and copy requirements
RUN mkdir -p /app
COPY requirements.txt /app/requirements.txt

# Install Python dependencies with uv (much faster than pip)
RUN UV_HTTP_TIMEOUT=300 uv pip install --system --no-cache --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host download.pytorch.org -r /app/requirements.txt

COPY . /app

# Set working directory to app so marimo opens there by default
WORKDIR /app/work

EXPOSE 2718

CMD ["marimo", "edit", "/app", "--host", "0.0.0.0", "--port", "2718", "--token-password", "${MARIMO_PASSWORD}"]
