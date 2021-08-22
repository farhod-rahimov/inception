# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:08:16 by btammara          #+#    #+#              #
#    Updated: 2021/08/22 15:34:18 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# CONTAINER OS
FROM debian:buster

# UPDATE & UPGARDE PACKAGES
RUN apt-get update
RUN apt-get upgrade -y

# INSTALL WGET AND VIM
RUN apt-get -y install wget && apt-get -y install vim

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