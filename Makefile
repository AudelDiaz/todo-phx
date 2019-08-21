create-all:
	docker-compose exec todo mix ecto.create
	docker-compose exec note mix ecto.create

migrate-all:
	docker-compose exec todo mix ecto.migrate
	docker-compose exec note mix ecto.migrate

build:
	docker-compose build

run:
	docker-compose up -d

ps:
	docker-compose ps

stop:
	docker-compose stop

logs:
	docker-compose logs -f $(APP)