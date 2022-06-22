#!/bin/bash

# Setup do SSL (C=pais, ST=estado, L=localizacao O=organizacao CN=nome)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj '/C=BR/ST=SP/L=SP/O=42SP/CN=pcunha' \
	-keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt


# Copy config file to correct directory
cp ./conf/nginx.conf /etc/nginx/sites-available/default
