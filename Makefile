provision:
	docker-compose up -d backend-server && . ./check-db-status.sh
	docker-compose exec -T backend-server bash -c 'cd /app/backend && php artisan migrate'

runserver:
	docker-compose up backend-server
runapp:
	docker-compose up app
