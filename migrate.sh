#!/bin/sh

# Set the application port, default to 8000
APP_PORT=${PORT:-8000}

cd /app/


source /opt/venv/bin/activate


/opt/venv/bin/python manage.py migrate --noinput


SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL:-"admin@gmail.com"}


/opt/venv/bin/python manage.py createsuperuser --email $SUPERUSER_EMAIL --noinput || true


/opt/venv/bin/gunicorn --worker-tmp-dir /dev/shm core.wsgi:application --bind "0.0.0.0:${APP_PORT}"
