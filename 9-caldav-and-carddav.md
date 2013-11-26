CalDAV and CardDAV
==================

    sudo apt-get update
    sudo apt-get install radicale

    # Allow Radicale to be started at boot
    rm /etc/default/radicale
    ln -s /root/server-config/files/etc/default/radicale /etc/default/radicale
    
    # Configuration
    rm /etc/radicale/config
    ln -s /root/server-config/files/etc/radicale/config /etc/radicale/config
    
    # Create the user file
    htpasswd -c -d /etc/radicale/users andrew
    # Enter password
    
    # Start the service
    /etc/init.d/radicale start
    
    # Create your calendar. Login using usernamd and password from htpasswd step
    # Navigate to https://andrewbrereton.com:5232/andrew/calendar.ics/
    
    # Create your address book
    # Navigate to https://andrewbrereton.com:5232/andrew/AddressBook.vcf/

On Android phone:

1. Download DAVdroid.
2. Create new DAVdroid account
3. Root URL: https://andrewbrereton.com:5232/andrew/
4. User name: andrew
5. Password: (Password that was used earlier to create htpasswd user)
6. Preemptive authentication: true

Install AgenDAV - a web based caldav client

    mkdir /var/www/calendar.andrewbrereton.com
    cd /var/www/calendar.andrewbrereton.com
    git clone https://github.com/adobo/agendav.git .
    
    # Create database
    mysql --default-character-set=utf8 -uroot -p
    mysql> GRANT ALL PRIVILEGES ON agendav.* TO agendav@localhost IDENTIFIED BY 'yourpassword'
    mysql> CREATE DATABASE agendav CHARACTER SET utf8 COLLATE utf8_general_ci;
    mysql> FLUSH PRIVILEGES;
    mysql> ^D
    
    # Create schema
    mysql --default-character-set=utf8 -uagendav -p agendav < sql/mysql.schema.sql
    
    # Create Apache config
    ln -s /root/server-config/files/etc/apache2/sites-available/calendar.andrewbrereton.com /etc/apache2/sites-available/calendar.andrewbrereton.com
    
    # Enable site
    a2ensite calendar.andrewbrereton.com
    
    # Reload Apache
    service apache2 reload

    # Configuration
    cp /root/server-config/files/var/www/calendar.andrewbrereton.com/web/config/* /var/www/calendar.andrewbrereton.com/web/config/

    # Composer
    cd /var/www/calendar.andrewbrereton.com/web
    composer install
    
    # Permissions
    chown -R www-data:www-data /var/www/calendar.andrewbrereton.com
    chmod -R 777 /var/www/calendar.andrewbrereton.com/web/application/logs
