# Authentication

## Table of Contents

<!-- - [Overview](#overview)
- [Key Features](#key-features)
- [Status](#status)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [installation](#installation)
  - [Set Up Environment Variables](#set-up-environment-variables)
  - [Apply Database Migrations](#apply-database-migrations)
  - [Running the Application](#running-the-application)
- [Schema](#schema)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact) -->

## Overview 🎯

Welcome to the Authentication Application, a powerful backend solution for cross-platform authentication. This project provides robust and secure authentication services via API endpoints. It is built using [Django](https://www.djangoproject.com/) and [Django REST framework](https://www.django-rest-framework.org/), and it does not include frontend components or user login forms. Developers can create separate frontend applications using frameworks like React or Vue.js.

### Key Features

- **🌐 Cross-Platform Authentication**: The project offers a powerful backend for cross-platform authentication, allowing various applications, mobile or web, to securely authenticate users and access protected resources.

- **⛓️ Data Exchange through DRF**: The heart of this project is the Django REST framework (DRF), which provides a structured and efficient API for data exchange. It includes endpoints for user registration, login, users management, password reset, change & confirm, and confirm email, and more.

- **🔐 JWT-based Authentication**: JSON Web Token (JWT) authentication is at the core of securing access to API endpoints, providing a seamless and secure way to validate and manage user identity.

- **🌆 Separation from Frontend**: The project intentionally does not include user login forms or frontend interfaces. Developers can create frontend applications separately using frameworks like React or Vue.js, ensuring flexibility and versatility in frontend design.

### 🌟 Status

Please note that this project is actively under development and is not yet considered production-ready. Its primary focus is on delivering a backend solution for cross-platform authentication and data exchange.⚙️

## Getting Started 🚀

To get started with the Django Authentication Application, follow these steps:

#### Prerequisites

**🐍 Python**: Ensure you have Python installed. You can download Python from the [official Python website](https://www.python.org/downloads/).

#### 📦 installation

**Clone the Repository:** Clone the project repository to your local machine:

    git clone https://github.com/FMashi/Authentication.git

**🛠️ Install Dependencies:** Install the required Python packages and dependencies listed in the **requirements.txt** file:

    python -m venv venv
    source venv/bin/activate
    # On Windows, use
    venv\Scripts\activate

    pip install -r requirements.txt

**🔑 Set Up Environment Variables:** Create a **.env** file in the project's root directory with your Django project and configuration variables, such as:

    SECRET_KEY = your secret key
    DEBUG = 1
    POSTGRES_READY = 0  # Set to 1 if using Postgres

    # Postgres Database Configuration
    POSTGRES_DBNAME = your Postgres database Name
    POSTGRES_PASSWORD = your Postgres password
    POSTGRES_USER = your Postgres user
    POSTGRES_HOST = your Postgres host
    POSTGRES_PORT = your Postgres port

    # Redis Configuration
    REDIS_HOST = your Redis host
    REDIS_PORT = your Redis Port

    # Email SMTP Configuration
    EMAIL_HOST = your email host
    EMAIL_USE_TLS = True
    EMAIL_HOST_USER = your email user
    EMAIL_HOST_PASSWORD = your email password
    EMAIL_PORT = your email port

##### Add other environment variables as needed

**🖇️ Apply Database Migrations:** Run database migrations to create the database schema:

    python manage.py makemigrations
    python manage.py migrate

**🪄 Running the Application:**

    python manage.py runserver

**♾️ Start the Gunicorn Server:** Launch the Gunicorn server to run the application:

    gunicorn core.wsgi:application --bind 0.0.0.0:8000

**✨ Access the API:** The application exposes its endpoints at [localhost](http://localhost:8000). You can use API clients like Postman or cURL to interact with the available endpoints **schema**.

##### 🕸️ Schema

I included a **schema.yml** file in the project, which describes the structure and format of the API endpoints. You can use this schema to better understand and interact with the API.

### 🏷️ Usage

The Django Authentication Application provides a set of RESTful API endpoints that can be integrated into your frontend or used for server-client communication.

### ⚖️ License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

### ✉️ Contact

If you have questions, need assistance, or want to get in touch, please feel free to use the [Issues](https://github.com/FMashi/Authentication/issues) section in this repository. Your feedback and collaboration are highly valued.

📧 You can also reach out via email at: Fahadmashi@hotmail.com

**Note:** This README reflects the project's current status as of the last update. Ongoing development may impact project features and usage. 🔧
