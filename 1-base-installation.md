Base Installation
=================

Amazon AWS EC2 Instance (micro)

OS: Ubuntu 13.04

Ports: 22, 25, 80, 143, 443, 993, 995, 5222, 5269, 5280

    # Root
    sudo su
    
    # Update
    apt-get update
    apt-get upgrade
    
    # Hostname
    echo "andrewbrereton.com" > /etc/hostname
    
    # Timezone
    dpkg-reconfigure tzdata
    tzselect
    
    # Pre-requisites
    apt-get install git
    
    # Get this repo
    cd ~
    git clone https://github.com/andrewbrereton/server-config.git

    # Composer
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
