Blog
====

  sudo su
  
  # Pre-requisites
  apt-get install php5-curl
  service apache2 reload
  
  # MySQL
  mysql -u root -p
  
  mysql> create database blog;
  mysql> grant all privileges on blog.* to 'blog'@'localhost' identified by 'SUPERSTRONGPASSWORD';
  mysql> flush privileges;
  mysql> -- execute the SQL in mysql.md
  mysql> exit
  
  # Converspace
  git clone https://github.com/converspace/converspace /var/www/blog.andrewbrereton.com
  
  # Composer
  cd /var/www/blog.andrewbrereton.com
  curl -sS https://getcomposer.org/installer | php
  php composer.phar install
  
  # Configs
  rm /var/www/blog.andrewbrereton.com/conf/production.conf.php
  ln -s /root/server-config/files/var/www/blog.andrewbrereton.com/conf/production.conf.php /var/www/blog.andrewbrereton.com/conf/production.conf.php

  rm /etc/apache2/sites-available/blog.andrewbrereton.com
  ln -s /root/server-config/files/etc/apache2/sites-available/blog.andrewbrereton.com /etc/apache2/sites-available/blog.andrewbrereton.com

  # Let's go live
  a2ensite blog.andrewbrereton.com
  service apache2 reload
