# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:08:16 by btammara          #+#    #+#              #
#    Updated: 2021/08/29 20:19:28 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# CONTAINER OS
FROM debian:buster

# UPDATE & UPGARDE PACKAGES
RUN apt-get update
RUN apt-get upgrade -y

# INSTALL WGET, VIM AND TOP
RUN apt-get -y install wget && apt-get -y install vim && apt-get install -y procps

# INSTALL PHP
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf

# INSTALL WORDPRESS
WORKDIR /var/www/html/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY ./wp-config.php /var/www/html/

# COPY START SCRIPT
COPY ./start.sh /var/

# START CONTAINER
CMD bash /var/start.sh

# EXPOSE 9000
EXPOSE 9000