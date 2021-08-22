# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:12:35 by btammara          #+#    #+#              #
#    Updated: 2021/08/22 10:10:37 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# service nginx start
service mysql start
# service php7.3-fpm start
# /usr/sbin/php-fpm7.3 -y /etc/php/7.3/fpm/php-fpm.conf

echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' identified by 'admin' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
# echo "UPDATE mysql.user set plugin='' where user='root';"| mysql -u root --skip-password
# mysql -u root -p wordpress --skip-password < wordpress.sql

tail -f
bash