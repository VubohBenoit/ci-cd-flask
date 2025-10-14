FROM python:3.10-slim
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ ./app
EXPOSE 8000
ENV PYTHONPATH="${PYTHONPATH}:/app"
CMD ["python", "app/main.py"]
