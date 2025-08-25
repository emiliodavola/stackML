FROM python:3.10-slim
WORKDIR /app
RUN pip install jupyter
COPY . /app
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
