# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: btammara <btammara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:12:35 by btammara          #+#    #+#              #
#    Updated: 2021/08/30 13:24:38 by btammara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

mysql_install_db

service mysql start

echo "CREATE DATABASE $WORDPRESS_DATABASE_NAME;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON $WORDPRESS_DATABASE_NAME.* TO '$WORDPRESS_USER'@'%' identified by '$WORDPRESS_PASSWORD' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
mysql -u root -p $WORDPRESS_DATABASE_NAME --skip-password < /var/www/html/wordpress.sql

service mysql stop

mysqld
