FROM python:3.10-slim

WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt .
COPY requirements-dev.txt .

# Installer les dépendances (production + dev)
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir -r requirements-dev.txt

# Copier tout le projet
COPY . .

# Exposer le port
EXPOSE 8000

ENV PYTHONPATH=/app

CMD ["python", "app/main.py"]

