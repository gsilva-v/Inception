# NGNIX DOCKERFILE
FROM debian:buster

# instala os pacotes necessarios para o nginx e o tls
COPY ./conf ./conf

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y php-fpm && \
	apt-get install -y nginx && \
	apt-get install -y openssl

# Execute setup script
RUN bash ./conf/setup.sh

# Para produção normal (em um servidor), use o daemon padrão ativado; diretiva para que o servidor Nginx seja iniciado em segundo plano. 
# Desta forma, o Nginx e outros serviços estão rodando e conversando entre si. Um servidor executa muitos serviços.

# Para contêineres do Docker (ou para depuração), o daemon é desativado; diretiva diz ao Nginx para ficar em primeiro plano. 
# Para contêineres, isso é útil, pois a prática recomendada é para um contêiner = um processo. 
# Um servidor (contêiner) possui apenas um serviço.

# OU SEJA, ESSE CONTAINER SO TERA O SERVIÇO DO NGINX
# RUN		echo "daemon off;" >> /etc/nginx/nginx.conf

# expoe a porta solicitada pelo nginx
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
