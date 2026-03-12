.PHONY: setup test dev build build-prod push

setup:
	sudo docker compose run --rm app make setup

test:
	sudo docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

dev:
	sudo docker compose up

build:
	sudo docker compose build

build-prod:
	sudo docker compose -f docker-compose.yml build app

push:
	sudo docker compose -f docker-compose.yml push app