Base Installation
=================

Amazon AWS EC2 Instance (micro)

OS: Ubuntu 13.04

Ports: 22, 25, 143, 443, 993, 995, 5222, 5269, 5280

    # Root
    sudo su
    
    # Update
    apt-get update
    apt-get upgrade
    
    # Hostname
    echo "andrewbrereton.com" > /etc/hostname
    
    # Pre-requisites
    apt-get install fail2ban git
    
    # Get this repo
    cd ~
    git clone https://github.com/andrewbrereton/server-config.git
