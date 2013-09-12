Webmail
=======

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
    ln -s /root/server-config/files/etc/roundcube/apache.conf /etc/roundcube/apache.conf

    # Disable default sites
    a2dissite default default-ssl
    
    # Enable Apache modules
    a2enmod ssl

    # Restart Apache    
    service apache2 reload
    
    rm /etc/roundcube/main.inc.php
    ln -s /root/server-config/files/etc/roundcube/main.inc.php /etc/roundcube/main.inc.php
    
    # Make a self-signed certificate
    make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /root/certs/andrewbrereton.com.pem
    # Hostname: andrewbrereton.com
    # Alternative Name:

    # Login
    Go to https://webmail.andrewbrereton.com/
    Username: andrew@andrewbrereton.com
    Password: <PASSWORD>
