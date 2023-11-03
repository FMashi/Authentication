FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the Django project files into the container
COPY . /app/

# Install Python 3 and create a virtual environment
RUN apt-get update && apt-get install -y python3 && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip

# Install Gunicorn
RUN /opt/venv/bin/pip install gunicorn

# Install project dependencies
RUN /opt/venv/bin/pip install -r requirements.txt

# Collect static files (if your project uses them)
# RUN rm -rf /path/to/static/root/*
# RUN /opt/venv/bin/python manage.py collectstatic --noinput

# Expose the port the application runs on
EXPOSE 8000

# Start the Django application
CMD ["/opt/venv/bin/gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]
