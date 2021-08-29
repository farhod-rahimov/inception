# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:08:16 by btammara          #+#    #+#              #
#    Updated: 2021/08/29 20:19:24 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# CONTAINER OS
FROM debian:buster

# UPDATE & UPGARDE PACKAGES
RUN apt-get update
RUN apt-get upgrade -y

# INSTALL WGET, VIM AND TOP
RUN apt-get -y install wget && apt-get -y install vim && apt-get install -y procps

# INSTALL NGINX
RUN apt-get -y install nginx
COPY ./nginx.conf /etc/nginx/sites-available/localhost
COPY ./fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
COPY ./index.html /var/www/html/

# COPY START SCRIPT
COPY ./start.sh /var/

# ISSUE SELFSIGNED SSL CERTIFICATE
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Republic of Tatarstan/L=Kazan/O=21school/CN=www.localhost' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# START CONTAINER
CMD bash /var/start.sh

EXPOSE 443