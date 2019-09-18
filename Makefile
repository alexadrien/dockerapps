## GLOBAL COMMANDS

install:
	docker-compose build --no-cache
	make migrate_db

start:
	docker-compose up -d

restart:
	docker-compose restart

stop:
	docker-compose stop

uninstall:
	docker-compose down

## BACK COMMANDS

migrate_db:
	make start
	docker-compose exec back python manage.py migrate

make_migrations:
	make start
	docker-compose exec back python manage.py makemigrations

create_super_user:
	make start
	docker-compose exec back python manage.py createsuperuser

## UTILS

save:
	git add .
	git commit -a -m "save"
	git push
