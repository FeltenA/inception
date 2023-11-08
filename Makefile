all: up

up:
		@docker compose -f ./srcs/docker-compose.yml up -d

down:
		@docker compose -f ./srcs/docker-compose.yml down

.PHONY: all up down