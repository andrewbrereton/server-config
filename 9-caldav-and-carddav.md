CalDAV and CardDAV
==================

    cd /var/www
    git clone https://github.com/jeromeschneider/Baikal.git baikal.andrewbrereton.com
    cd baikal.andrewbrereton.com
    composer install
    chown -Rf www-data:www-data .

    ln -s /root/server-config/files/etc/apache2/sites-available/baikal.andrewbrereton.com /etc/apache2/sites-available/baikal.andrewbrereton.com
    
    a2ensite baikal.andrewbrereton.com
    service apache2 reload
    
    # Create database
    mysql --default-character-set=utf8 -uroot -p
    mysql> GRANT ALL PRIVILEGES ON baikal.* TO baikal@localhost IDENTIFIED BY 'yourpassword';
    mysql> CREATE DATABASE baikal CHARACTER SET utf8 COLLATE utf8_general_ci;
    mysql> FLUSH PRIVILEGES;
    mysql> ^D

    # Navigate to https://baikal.andrewbrereton.com/admin/
    # Configure via web admin interface
    
    # Navigate to https://baikal.andrewbrereton.com/admin/?/users/new/1/#form
    # Create a new user
    
On Android phone:

1. Download DAVdroid.
2. Create new DAVdroid account
3. Root URL: https://baikal.andrewbrereton.com/cal.php/principals/andrew
4. User name: andrew
5. Password: (Password that was used earlier to create htpasswd user)
6. Preemptive authentication: false
7. Add Calendar

1. Create new DAVdroid account
2. Root URL: https://baikal.andrewbrereton.com/card.php/principals/andrew
3. User name: andrew
4. Password: (Password that was used earlier to create htpasswd user)
5. Preemptive authentication: false
