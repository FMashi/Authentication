#!/bin/sh
# entrypoint.sh

# Set the application port (default is 8000)
APP_PORT="${PORT:-8000}"

# Change to the app directory
cd /app/

# Activate the virtual environment
source /opt/venv/bin/activate

# Run migrations
python manage.py migrate

# Collect static files without user interaction
python manage.py collectstatic --noinput

# Start the Gunicorn server
/opt/venv/bin/gunicorn --worker-tmp-dir /dev/shm core.wsgi:application --bind "0.0.0.0:${APP_PORT}"
