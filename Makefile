# Check if OS is Windows
ifeq ($(OS),Windows_NT)
	DOCKER_COMPOSE := docker-compose
	DOCKER := docker
else
	DOCKER_COMPOSE := $(shell which docker-compose)
	DOCKER := $(shell which docker)
endif

.PHONY: database
database:
	$(DOCKER) run -d -p 3306:3306 --env-file .env -v db-data-radar:/var/lib/mysql mariadb:10.4.0

.PHONY: build
build:
	$(DOCKER) build -t data-radar .

.PHONY: run
run: build
	$(DOCKER) run -d -p 8000:8000 --env-file .env data-radar

.PHONY: clean
clean:
	$(DOCKER) ps -q | xargs $(DOCKER) stop
	$(DOCKER) container prune -f

.PHONY: up
up:
	$(DOCKER_COMPOSE) up -d --build

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: format
format:
	isort -rc --atomic .
	black .
	flake8 .
