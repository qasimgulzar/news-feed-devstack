provision:
	docker-compose up -d backend-server
	docker-compose exec -T backend-server bash -c 'cd /app/backend && php artisan migrate'

runserver:
	docker-compose up backend-server
runapp:
	docker-compose up app
