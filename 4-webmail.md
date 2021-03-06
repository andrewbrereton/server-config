Webmail
=======

    # Root
    sudo su
    
    # Install stuff
    apt-get install mysql-server
    # New password for the MySQL "root" user: <PICK A STRONG PASSWORD>
    
    # Install Roundcube
    cd /tmp
    wget https://github.com/roundcube/roundcubemail/archive/v0.9.5.zip
    unzip v0.9.5.zip
    mv roundcubemail-0.9.5/ /var/www/webmail.andrewbrereton.com
    rm v0.9.5.zip
    chmod -R 777 /var/www/webmail.andrewbrereton.com/temp/ /var/www/webmail.andrewbrereton.com/temp/ /var/www/webmail.andrewbrereton.com/config/
    
    # Create database
    mysql --default-character-set=utf8 -uroot -p
    mysql> GRANT ALL PRIVILEGES ON roundcube.* TO roundcube@localhost IDENTIFIED BY 'SUPERSTRONGPASSWORD';
    mysql> CREATE DATABASE roundcube CHARACTER SET utf8 COLLATE utf8_general_ci;
    mysql> FLUSH PRIVILEGES;
    mysql> ^D
    
    # Create schema
    cd /var/www/webmail.andrewbrereton.com
    mysql -uroot -p roundcube < SQL/mysql.initial.sql

    # Roundcube Apache config
    ln -s /server-config/files/etc/apache2/sites-available/webmail.andrewbrereton.com /etc/apache2/sites-available/webmail.andrewbrereton.com

    # Restart Apache    
    service apache2 reload

    # Add carddav plugin
    cd /tmp
    wget https://github.com/daiw/Roundcube-CardDAV/archive/16181afb2d390452f68151ea17d7db4f9fdd578a.zip
    unzip 16181afb2d390452f68151ea17d7db4f9fdd578a.zip
    mv -f Roundcube-CardDAV-* carddav
    mv carddav /var/www/webmail.andrewbrereton.com/plugins/
    rm 16181afb2d390452f68151ea17d7db4f9fdd578a.zip
    mysql -uroot -p roundcube < /var/www/webmail.andrewbrereton.com/plugins/carddav/SQL/mysql.sql
    cp /var/www/webmail.andrewbrereton.com/plugins/carddav/config.inc.php.dist /var/www/webmail.andrewbrereton.com/plugins/carddav/config.inc.php

    # Navigate to https://webmail.andrewbrereton.com/installer/
    # Configure 
    # The installer will give you the contents of the db.inc.php and main.inc.php
    # Copy the db.inc.php to the config/ directory
    
    # Use the pre-made main.inc.php
    ln -s /server-config/files/var/www/webmail.andrewbrereton.com/config/main.inc.php /var/www/webmail.andrewbrereton.com/config/main.inc.php

    # If all good, delete the installer directory
    rm -Rf /var/www/webmail.andrewbrereton.com/installer

    # Login
    # Navigate to https://webmail.andrewbrereton.com/
    # Username: andrew@andrewbrereton.com
    # Password: SUPERSTRONGPASSWORD

    # Configure carddav plugin
    # Go to Settings > CardDAV
    # Label: baikal
    # Server: https://baikal.andrewbrereton.com/card.php/principals/andrew
    # Username: andrew
    # Password: SUPERSTRONGPASSWORD
    # Read only: false

