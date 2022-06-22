Vol_Path = ${HOME}/data/
Vol_DB = ${Vol_Path}db/
Vol_WP = ${Vol_Path}wordpress/
Domain = gsilva-v.42.fr
LocalHost = 127.0.0.1

up: conf
	@sudo docker-compose -f  ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

down:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

conf:
	@sudo mkdir -p ${Vol_Path} ${Vol_DB} ${Vol_WP}
	@sudo chmod 777 /etc/hosts
	@sudo cat /etc/hosts | grep ${Domain} || sudo echo "${LocalHost} ${Domain}" >> /etc/hosts

clean: down
	@sudo bash rm_images.sh

fclean: clean
	@sudo rm -rf ${Vol_DB} ${Vol_WP}

re: fclean up

ps:
	@sudo docker ps