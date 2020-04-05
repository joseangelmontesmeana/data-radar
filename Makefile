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
	$(DOCKER) run -d -p 3306:3306 --env-file .env mariadb:10.4.0

.PHONY: build
build:
	$(DOCKER) build -t data-radar .

.PHONY: run
run: build
	$(DOCKER) run -p 8000:8000 --env-file .env data-radar

