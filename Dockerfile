FROM python:3.10-slim

# Définir le dossier de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt requirements.txt
COPY requirements-dev.txt requirements-dev.txt

# Installer les dépendances (prod + dev)
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir -r requirements-dev.txt

# Copier le reste du code
COPY app/ ./app
COPY tests/ ./tests

# Exposer le port Flask
EXPOSE 8000

# Ajouter le répertoire app au PYTHONPATH
ENV PYTHONPATH="${PYTHONPATH}:/app"

# Lancer l’application Flask
CMD ["python", "app/main.py"]

