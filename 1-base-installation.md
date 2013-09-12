Base Installation
=================

Amazon AWS EC2 Instance (micro)
OS: Ubuntu 13.04
Ports: 22, 25, 143, 443, 993, 995, 5222, 5269, 5280

    sudo su
    apt-get update
    apt-get upgrade
    echo "andrewbrereton.com" > /etc/hostname
    apt-get install fail2ban git
    cd ~
    git clone https://github.com/andrewbrereton/server-config.git
