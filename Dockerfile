# Use the official Python image as the base image
FROM python:3.9-slim

# Set environment variables to optimize Python's behavior
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the Django project files into the container
COPY . .

# Install project dependencies, system dependencies, and cleanup in a single step
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && apt-get install -y \
    python3-venv \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
    && /opt/venv/bin/pip install --no-cache-dir gunicorn -r requirements.txt


# Collect static files (if your project uses them)
RUN rm -rf /path/to/static/root/*
RUN /opt/venv/bin/python manage.py collectstatic --noinput

# Expose the port the application runs on
EXPOSE 8000

# Start the Django application using Gunicorn
CMD ["/opt/venv/bin/gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]
