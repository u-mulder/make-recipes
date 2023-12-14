# Variables
DOCKER_COMPOSE=docker-compose
DOCKER_COMPOSE_FILE=docker-compose.yaml
DOCKER_ENV_FILE=docker.env

# Recipes
## Docker and docker-compose commands
##--- Starting/stopping containers ---

.PHONY: up
up:
	@echo "Starting up the containers"
	@$(DOCKER_COMPOSE) --env-file $(DOCKER_ENV_FILE) -f $(DOCKER_COMPOSE_FILE) up -d

.PHONY: down
down:
	@echo "Stopping the containers"
	@$(DOCKER_COMPOSE) --env-file $(DOCKER_ENV_FILE) -f $(DOCKER_COMPOSE_FILE) down

.PHONY: start
start: up

.PHONY: stop
stop: down
