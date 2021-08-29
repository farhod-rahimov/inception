# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:12:35 by btammara          #+#    #+#              #
#    Updated: 2021/08/29 17:47:20 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

service mysql start

echo "CREATE DATABASE $WORDPRESS_DATABASE_NAME;"| mysql -u root --skip-password
# echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON $WORDPRESS_DATABASE_NAME.* TO '$WORDPRESS_USER'@'%' identified by '$WORDPRESS_PASSWORD' WITH GRANT OPTION;"| mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' identified by 'admin' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
mysql -u root -p $WORDPRESS_DATABASE_NAME --skip-password < /var/www/html/wordpress.sql

tail -f
bash