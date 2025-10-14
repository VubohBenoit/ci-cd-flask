FROM python:3.10-slim

WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt .
COPY requirements-dev.txt .

# Installer les dépendances (production + dev)
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir -r requirements-dev.txt

# Copier le reste du code
COPY . .

# Exposer le port Flask
EXPOSE 8000

# Définir la variable d'environnement
ENV PYTHONPATH=/app

# Lancer le serveur Flask
CMD ["python", "app/main.py"]


