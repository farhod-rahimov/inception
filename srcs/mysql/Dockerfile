# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:08:16 by btammara          #+#    #+#              #
#    Updated: 2021/08/29 20:19:03 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# CONTAINER OS
FROM debian:buster

# UPDATE & UPGARDE PACKAGES
RUN apt-get update
RUN apt-get upgrade -y

# INSTALL WGET, VIM AND TOP
RUN apt-get -y install wget && apt-get -y install vim && apt-get install -y procps

# INSTALL MARIADB
RUN apt-get -y install mariadb-server && apt-get install net-tools
COPY ./my.cnf /etc/mysql/my.cnf
RUN mkdir -p /var/www/html/
COPY ./wordpress.sql /var/www/html

# COPY START SCRIPT
COPY ./start.sh /var/

# START CONTAINER
CMD bash /var/start.sh

EXPOSE 3306