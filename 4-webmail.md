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
    chmod -R 777 /var/www/webmail.andrewbrereton.com/temp/ /var/www/webmail.andrewbrereton.com/logs/
    
    # Create database
    mysql --default-character-set=utf8 -uroot -p
    mysql> GRANT ALL PRIVILEGES ON roundcube.* TO roundcube@localhost IDENTIFIED BY 'SUPERSTRONGPASSWORD';
    mysql> CREATE DATABASE roundcube CHARACTER SET utf8 COLLATE utf8_general_ci;
    mysql> FLUSH PRIVILEGES;
    mysql> ^D

    # Roundcube Apache config
    ln -s /server-config/files/etc/apache2/sites-available/webmail.andrewbrereton.com /etc/apache2/sites-available/webmail.andrewbrereton.com
    
    # Enable Apache modules
    a2enmod ssl

    # Restart Apache    
    service apache2 reload

    # Navigate to https://webmail.andrewbrereton.com/installer/
    # Configure 
    



    # Root
    sudo su

    # Install stuff
    apt-get install mysql-server roundcube roundcube-mysql roundcube-plugins-extra
    # New password for the MySQL "root" user: <PICK A STRONG PASSWORD>
    # Configure database for roundcube with dbconfig-common?  Yes
    # Database type to be used by roundcube: mysql
    # Password of the database's administrative user:
    # MySQL application password for roundcube:

    # Roundcube Apache config
    rm /etc/roundcube/apache.conf
    ln -s /server-config/files/etc/roundcube/apache.conf /etc/roundcube/apache.conf

    # Disable default sites
    a2dissite default default-ssl
    
    # Enable Apache modules
    a2enmod ssl

    # Restart Apache    
    service apache2 reload
    
    # Add plugin manager
    cd /tmp
    wget http://dev.myroundcube.com/?_action=plugin.plugin_server_get_pm
    mv index.html\?_action\=plugin.plugin_server_get_pm plugins.zip
    unzip plugins.zip
    mv -f plugins/* /usr/share/roundcube/plugins/
    rm -Rf plugins.zip plugins/
    ln -s /usr/share/roundcube/plugins/codemirror_ui /var/lib/roundcube/plugins/codemirror_ui
    ln -s /usr/share/roundcube/plugins/db_version /var/lib/roundcube/plugins/db_version
    ln -s /usr/share/roundcube/plugins/http_request /var/lib/roundcube/plugins/http_request
    ln -s /usr/share/roundcube/plugins/plugin_manager /var/lib/roundcube/plugins/plugin_manager
    ln -s /usr/share/roundcube/plugins/qtip /var/lib/roundcube/plugins/qtip
    ln -s /usr/share/roundcube/plugins/settings /var/lib/roundcube/plugins/settings
    
    rm /etc/roundcube/main.inc.php
    ln -s /server-config/files/etc/roundcube/main.inc.php /etc/roundcube/main.inc.php
    
    # Make a self-signed certificate
    make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /certs/andrewbrereton.com.pem
    # Hostname: andrewbrereton.com
    # Alternative Name:

    # Login
    Go to https://webmail.andrewbrereton.com/
    Username: andrew@andrewbrereton.com
    Password: <PASSWORD>
