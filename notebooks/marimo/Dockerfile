FROM python:3.12-slim
RUN apt-get update && apt-get install -y ca-certificates gcc g++ make && update-ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools && \
    pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host download.pytorch.org --no-cache-dir -r /app/requirements.txt
COPY . /app
EXPOSE 2718
CMD ["marimo", "edit", "/app", "--host", "0.0.0.0", "--port", "2718", "--no-token"]
