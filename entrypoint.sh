#!/bin/sh

# Set the application port, default to 8000
APP_PORT=${PORT:-8000}

# Change the working directory to your Django project
cd /app/

# Activate the virtual environment
source /opt/venv/bin/activate
python manage.py migrate
python manage.py collectstatic --noinput

# Run Gunicorn to serve your Django application
# /opt/venv/bin/gunicorn --worker-tmp-dir /dev/shm core.wsgi:application --bind "0.0.0.0:${APP_PORT}"
gunicorn core.wsgi:application --bind 0.0.0.0:8000