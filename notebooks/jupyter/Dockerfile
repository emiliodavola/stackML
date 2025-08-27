FROM python:3.12-slim
RUN apt-get update && apt-get install -y ca-certificates gcc g++ make && update-ca-certificates
WORKDIR /home/jovyan
COPY requirements.txt /home/jovyan/requirements.txt
RUN pip install --upgrade pip setuptools && \
    pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host download.pytorch.org --no-cache-dir -r /app/requirements.txt
COPY . /home/jovyan
EXPOSE 8888
CMD ["jupyter", "server", "--ip=0.0.0.0", "--ServerApp.token=", "--ServerApp.password=", "--ServerApp.allow_origin=*", "--ServerApp.disable_check_xsrf=True", "--no-browser"]
