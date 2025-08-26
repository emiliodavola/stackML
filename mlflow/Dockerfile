FROM python:3.12-slim
WORKDIR /app
RUN pip install mlflow[extras] boto3
COPY . /app
EXPOSE 5000
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
