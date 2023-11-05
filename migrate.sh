#!/bin/sh
# migrate.sh

# Change to the app directory
cd /app/

# Activate the virtual environment
source /opt/venv/bin/activate

# Run migrations with --noinput flag
/opt/venv/bin/python manage.py migrate --noinput

# Set the DJANGO_SUPERUSER_EMAIL variable or use a default value
SUPERUSER_EMAIL="${DJANGO_SUPERUSER_EMAIL:-admin@gmail.com}"

# Create a superuser with the specified email
/opt/venv/bin/python manage.py createsuperuser --email "$SUPERUSER_EMAIL" --noinput || true
