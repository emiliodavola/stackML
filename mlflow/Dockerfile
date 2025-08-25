FROM python:3.12-slim
WORKDIR /app
RUN pip install mlflow[extras]
COPY . /app
EXPOSE 5000
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000", "--backend-store-uri", "sqlite:///mlflow.db", "--default-artifact-root", "s3://mlflow-artifacts"]
