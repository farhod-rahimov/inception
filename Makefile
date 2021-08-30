all:
		docker-compose build
		docker-compose up

clean:
		docker-compose down
		docker rmi $$(docker images -a -q)
		docker rm -f $$(docker ps -a -q)
		docker volume rm $$(docker volume ls -q)
		docker volume rm $$(docker volume ls -q)
		docker network rm $$(docker network ls -q)