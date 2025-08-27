FROM python:3.12-slim
RUN apt-get update && apt-get install -y ca-certificates gcc g++ make && update-ca-certificates
ENV PIP_NO_VERIFY_CERT=1
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools && \
    pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r /app/requirements.txt
COPY . /app
EXPOSE 8000
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
