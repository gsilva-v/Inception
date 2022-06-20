FROM debian:buster

# instala os pacotes necessarios para o nginx e o tls
RUN     apt-get update -y && \
     	apt-get upgrade -y && \
		apt-get install -y php-fpm && \
	    apt-get install -y nginx && \
	    apt-get install -y openssl 

#copia as configurações padroes para dentro da imagem que tera o nginx e transfere 
COPY    /conf/ /tmp/conf/
# por padrao o nginx deixa sua configuração padrao nesse caminho, entao o subistituimos para o desejado, configurado por nos
RUN     mv /tmp/conf/nginx.conf /etc/nginx/sites-available/default

RUN     openssl genrsa -out server.key 4096 
# C = Country
# ST = State
# O = Organization Name
# OU = Oragnization Unit Name
RUN     openssl req -new -key server.key -subj "/C=BR/ST=SaoPaulo/O=42SP/OU=42" -out server.csr
RUN     openssl req -x509 -in server.csr -key server.key -out server.crt
RUN     mv server.crt /etc/ssl/certs/
RUN     mv server.csr server.key /etc/ssl/private

# Para produção normal (em um servidor), use o daemon padrão ativado; diretiva para que o servidor Nginx seja iniciado em segundo plano. 
# Desta forma, o Nginx e outros serviços estão rodando e conversando entre si. Um servidor executa muitos serviços.

# Para contêineres do Docker (ou para depuração), o daemon é desativado; diretiva diz ao Nginx para ficar em primeiro plano. 
# Para contêineres, isso é útil, pois a prática recomendada é para um contêiner = um processo. 
# Um servidor (contêiner) possui apenas um serviço.

# OU SEJA, ESSE CONTAINER SO TERA O SERVIÇO DO NGINX
# RUN		echo "daemon off;" >> /etc/nginx/nginx.conf

# expoe a porta solicitada pelo nginx
EXPOSE 443

# inicializa o nginx
CMD ["nginx", "-g", "daemon off;"]