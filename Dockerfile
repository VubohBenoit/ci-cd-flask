# Utiliser Python 3.10 slim comme base
FROM python:3.10-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt requirements.txt
COPY requirements-dev.txt requirements-dev.txt

# Installer toutes les dépendances (production + dev)
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir -r requirements-dev.txt

# Copier le code source et les tests
COPY app/ ./app
COPY tests/ ./tests

# Exposer le port Flask
EXPOSE 8000

# Définir PYTHONPATH pour que les imports 'app' fonctionnent
ENV PYTHONPATH=/app

# Lancer l'application Flask
CMD ["python", "app/main.py"]