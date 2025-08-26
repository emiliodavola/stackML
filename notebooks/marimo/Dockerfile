FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY . /app
EXPOSE 2718
CMD ["marimo", "edit", "/app", "--host", "0.0.0.0", "--port", "2718", "--no-token"]
