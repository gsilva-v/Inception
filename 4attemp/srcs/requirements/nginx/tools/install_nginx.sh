#!/bin/bash
# Make updates and upgrades
apt-get upgrade && apt-get update

#Install some tools (vim wget openssl man)
#apt-get install -y vim man

#Install php and libraries required by the other softwares
apt-get install -y php-fpm

#Install nginx
apt-get install -y nginx

#Install opnssl (TSL)
apt-get install -y openssl
