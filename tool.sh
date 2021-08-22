echo 'build image'
echo 'docker build --tag nginx .'

echo 'run container'
echo 'docker run --interactive --tty --name mysql -p 3306:3306 mysql\n'
echo 'docker run --interactive --tty --name nginx -p 443:443 nginx\n'
echo 'docker run --interactive --tty --name wordpress -p 9000:9000 wordpress\n'

echo 'show images'
echo 'docker images\n'

echo 'show containers'
echo 'docker ps -a\n'

echo 'delete all images'
echo 'docker rmi $(docker images -a -q)\n'

echo 'delete all containers'
echo 'docker stop $(docker ps -a -q)'
echo 'docker rm $(docker ps -a -q)\n'

echo 'войти в контейнер'
echo 'docker exec -it mysql sh\n'