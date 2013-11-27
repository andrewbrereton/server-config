Securing
========

    # root
    sudo su

    # Pre-requisites
    apt-get update
    apt-get upgrade
    apt-get install fail2ban
    
    # Create OpenSSH config
    rm /etc/ssh/sshd_config
    ln -s /server-config/files/etc/ssh/sshd_config /etc/ssh/sshd_config
    
    # Restart service
    service ssh restart
    
    # Auto upgrade security fixes
    apt-get install unattended-upgrades
    
    # Create unattended-upgrades config
    rm /etc/apt/apt.conf.d/10periodic
    ln -s /server-config/files/etc/apt/apt.conf.d/10periodic /etc/apt/apt.conf.d/10periodic
    
    rm /etc/apt/apt.conf.d/20auto-upgrades
    ln -s /server-config/files/etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades

    rm /etc/apt/apt.conf.d/50unattended-upgrades
    ln -s /server-config/files/etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades

    # Restart unattended-upgrades script
    service unattended-upgrades restart
    
    # Email logs to me
    apt-get install logwatch
    rm /etc/cron.daily/00logwatch
    ln -s /server-config/files/etc/cron.daily/00logwatch /etc/cron.daily/00logwatch

    # SSL
    rm /etc/apache2/mods-enabled/ssl.conf
    ln -s /server-config/files/etcetc/apache2/mods-enabled/ssl.conf /etc/apache2/mods-available/ssl.conf
