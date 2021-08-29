# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: farhod <farhod@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 18:12:35 by btammara          #+#    #+#              #
#    Updated: 2021/08/29 18:17:21 by farhod           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

sed -i "s/WORDPRESS_DATABASE_NAME/$WORDPRESS_DATABASE_NAME/" wp-config.php
sed -i "s/WORDPRESS_USER/$WORDPRESS_USER/" wp-config.php
sed -i "s/WORDPRESS_PASSWORD/$WORDPRESS_PASSWORD/" wp-config.php

mkdir -p /run/php/

/usr/sbin/php-fpm7.3 -R -F
