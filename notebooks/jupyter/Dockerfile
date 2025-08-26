FROM python:3.12-slim
WORKDIR /home/jovyan
COPY requirements.txt /home/jovyan/requirements.txt
RUN pip install --no-cache-dir -r /home/jovyan/requirements.txt
COPY . /home/jovyan
EXPOSE 8888
CMD ["jupyter", "server", "--ip=0.0.0.0", "--ServerApp.token=", "--ServerApp.password=", "--ServerApp.allow_origin=*", "--ServerApp.disable_check_xsrf=True", "--no-browser"]
