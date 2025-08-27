FROM python:3.12-slim
RUN apt-get update && apt-get install -y ca-certificates gcc g++ make && update-ca-certificates
ENV PIP_NO_VERIFY_CERT=1
WORKDIR /app
RUN pip install --upgrade pip setuptools && \
    pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org mlflow[extras] boto3
COPY . /app
EXPOSE 5000
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
