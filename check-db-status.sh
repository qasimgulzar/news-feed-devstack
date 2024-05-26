GREEN='\033[0;32m'
echo "${GREEN}Waiting for MySQL"
until docker-compose exec -T db bash -c "mysql -uroot -se \"SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root');\"" &> /dev/null
	do
	  printf "."
	  sleep 1
	done
