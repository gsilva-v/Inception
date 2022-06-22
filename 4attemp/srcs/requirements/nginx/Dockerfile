# NGNIX DOCKERFILE
FROM debian:buster

# Copy scripts to inside container
COPY ./tools ./tools
COPY ./conf ./conf

# Execute installation && setup scripts
RUN bash ./tools/install_nginx.sh && \
	bash ./conf/setup_nginx.sh

EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
