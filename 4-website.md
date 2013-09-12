Website
=======

    # Root
    sudo su
    
    # Pre-requisites
    apt-get install git openjdk-7-jre php5-dev make libpcre3-dev 
    pecl install apc
    echo "extension=apc.so" > /etc/php5/mods-available/apc.ini
    php5enmod apc
    
    # Install
    cd /var/www
    mkdir andrewbrereton.com
    cd andrewbrereton.com
    git clone https://abrereton@bitbucket.org/abrereton/andrewbrereton.com.git .
    cp configs/apache/prod /etc/apache2/sites-available/andrewbrereton.com
    ./bin/upgrade.sh
    
    # Turn it on
    a2ensite andrewbrereton.com
    service apache2 restart
