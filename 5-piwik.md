Piwik
=====

    # Root
    sudo su
    
    # Pre-requisites
    apt-get install unzip
    
    # Download
    cd /var/www
    wget http://builds.piwik.org/latest.zip
    unzip latest.zip
    rm latest.zip How\ to\ install\ Piwik.html index.html
    mv piwik piwik.andrewbrereton.com
    
    # Permissions
    chown -R www-data:www-data /var/www/piwik.andrewbrereton.com
    chmod -R 0755 /var/www/piwik.andrewbrereton.com/tmp
    
    # Configure site
    ln -s /root/server-config/files/etc/apache2/sites-available/piwik.andrewbrereton.com /etc/apache2/sites-available/piwik.andrewbrereton.com
    a2ensite piwik.andrewbrereton.com
    service apache2 reload
    
    # Database
    mysql -u root -p
    CREATE DATABASE piwik;
    CREATE USER 'piwik'@'localhost' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON piwik.* TO 'piwik'@'localhost' WITH GRANT OPTION;
    exit;
    
    # Go through Piwik web installer
    # Copy and paste Piwik JavaScript code into website
