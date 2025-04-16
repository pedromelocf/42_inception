# Inception

<p align="center">
  <img src="https://github.com/pedromelocf/42_utilities/blob/master/inception.png" alt="Inception Badge">
</p>

> 🏰 A project from the 42 School curriculum focused on system administration and DevOps fundamentals using Docker.

## 📚 Project Overview

Inception is a **DevOps-oriented project** where the main goal is to virtualize a multi-service infrastructure using **Docker**. The project consists of building a fully containerized system where each service runs in its own container and interacts through a Docker network. 

This setup simulates a real-world environment using technologies that are essential in modern software engineering.

---

## 🧱 Architecture

The infrastructure includes the following services:

- **NGINX**: A web server configured with SSL using self-signed certificates.
- **WordPress**: A content management system (CMS) that allows users to create and manage a website.
- **MariaDB**: A relational database to store WordPress data.
- **Docker Compose**: Used to orchestrate and manage the multi-container setup.
- **Custom Network**: All services communicate over a user-defined Docker network.
- **Volumes**: Persistent data storage for WordPress and MariaDB.

---

### Directory Structure

```bash
.
├── Makefile
├── README.md
└── srcs
    └── requirements
        ├── docker-compose.yml
        ├── mariadb
        │   ├── conf
        │   │   └── my.cnf
        │   ├── Dockerfile
        │   └── tools
        │       └── dbscript.sh
        ├── nginx
        │   ├── conf
        │   │   └── nginx.conf
        │   └── Dockerfile
        ├── tools
        │   ├── help
        │   └── reset_docker_env.sh
        └── wordpress
            ├── conf
            │   └── www.conf
            ├── Dockerfile
            └── tools
                └── wpscript.sh
```
---

## 🛠️ Skills Demonstrated

This project showcases several practical skills, including:

### 🐳 Docker & DevOps
- Writing clean, modular `Dockerfile`s.
- Isolating services into containers following best practices.
- Managing container lifecycle with `docker-compose`.
- Creating and managing **Docker volumes** and **networks**.
- Writing `entrypoint.sh` scripts for container initialization.

### 🌐 Web Server & SSL
- Configuring **NGINX** as a reverse proxy.
- Creating **SSL certificates** using `openssl` for HTTPS support.
- Ensuring secure connections between clients and the web server.

### 🧩 System Integration
- Connecting **WordPress** with **MariaDB** using environment variables and persistent storage.
- Setting up database initialization through SQL scripts.
- Ensuring services start in the correct order using `depends_on` and health checks.

### 🛡️ Security & Permissions
- Avoiding running containers as root.
- Setting proper file and directory permissions.
- Handling sensitive environment variables safely.

---

## 📦 How to Use

Clone the repository and build the Docker environment:

```bash
git clone https://github.com/pedromelocf/42_inception.git
cd 42_inception
docker-compose up --build
