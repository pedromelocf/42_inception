DOCKER_COMPOSE_PATH := ./srcs/requirements/docker-compose.yml
DOCKER_RESTART_PATH := ./srcs/requirements/tools/reset_docker_env.sh
DOCKER_HELP_PATH := ./srcs/requirements/tools/help
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

containers:
	docker ps -a

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

resetdocker:
	@ $(DOCKER_RESTART_PATH)

help:
	@ cat $(DOCKER_HELP_PATH)

.PHONY: up build start down stop restart services logs startservice startserviceiter downservice restartservice reset_docker help