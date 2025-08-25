FROM python:3.12-slim
WORKDIR /home/jovyan
RUN pip install jupyter
COPY . /home/jovyan
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
