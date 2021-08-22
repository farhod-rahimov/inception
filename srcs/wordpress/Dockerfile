# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:08:16 by btammara          #+#    #+#              #
#    Updated: 2021/08/22 08:40:42 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# CONTAINER OS
FROM debian:buster

# UPDATE & UPGARDE PACKAGES
RUN apt-get update
RUN apt-get upgrade -y

# INSTALL WGET AND VIM
RUN apt-get -y install wget && apt-get -y install vim

# INSTALL MARIADB, PHP
RUN apt-get -y install mariadb-server && apt-get install net-tools
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf

# INSTALL PHP MY ADMIN
WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0-rc2/phpMyAdmin-5.1.0-rc2-english.tar.gz
RUN tar -xf phpMyAdmin-5.1.0-rc2-english.tar.gz && rm -rf phpMyAdmin-5.1.0-rc2-english.tar.gz
RUN mv phpMyAdmin-5.1.0-rc2-english phpmyadmin
COPY ./config.inc.php phpmyadmin

# INSTALL WORDPRESS
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY ./wp-config.php /var/www/html

# COPY PRELOADED DATABASE AND START.SH
# COPY ./wordpress.sql /var/www/html

# COPY START SCRIPT
COPY ./start.sh /var/

# ISSUE SELFSIGNED SSL CERTIFICATE
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/ST=Republic of Tatarstan/L=Kazan/O=21school/CN=www.localhost' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# START CONTAINER
CMD bash /var/start.sh

EXPOSE 9000 3306