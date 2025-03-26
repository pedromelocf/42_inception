DOCKER_COMPOSE_PATH := ./srcs/requirements/docker-compose.yml
COMPOSE := docker compose -f

all: up

up:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) up -d

build:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) build

start:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) start

down:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) down

stop:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) stop

restart:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) restart

services:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) ps

logs:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) logs -f

startservice:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) start $(word 2, $(MAKECMDGOALS))

downservice:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) down $(word 2, $(MAKECMDGOALS))

stopservice:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) stop $(word 2, $(MAKECMDGOALS))

restartservice:
	$(COMPOSE) $(DOCKER_COMPOSE_PATH) restart $(word 2, $(MAKECMDGOALS))

help:
	@echo "Usage: make [command]"
	@echo "Available commands:"
	@echo "  make build          - Builds Docker images without starting the containers."
	@echo "  make up             - Starts the containers in detached mode (-d)."
	@echo "  make start          - Starts stopped containers without recreating them."
	@echo "  make down           - Stops and removes containers, networks, and volumes."
	@echo "  make stop           - Stops containers without removing them."
	@echo "  make restart        - Restarts all containers."
	@echo "  make services       - Lists services and their statuses."
	@echo "  make logs           - Shows real-time logs of the containers."
	@echo "  make startservice   - Starts a specific service. Usage: make startservice service_name"
	@echo "  make downservice    - Stops and removes a specific service. Usage: make downservice service_name"
	@echo "  make stopservice    - Stops a specific service without removing it. Usage: make stopservice service_name"
	@echo "  make restartservice - Restarts a specific service. Usage: make restartservice service_name"
	@echo ""

.PHONY: up build start down stop restart services logs startservice downservice restartservice help