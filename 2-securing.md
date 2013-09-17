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
    ln -s /root/server-config/files/etc/ssh/sshd_config /etc/ssh/sshd_config
    
    # Restart service
    service ssh restart
    
    # Auto upgrade security fixes
    apt-get install unattended-upgrades
    
    # Create unattended-upgrades config
    rm /etc/apt/apt.conf.d/20auto-upgrades
    ln -s /root/server-config/etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades

    rm /etc/apt/apt.conf.d/50unattended-upgrades
    ln -s /root/server-config/etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades

    # Restart unattended-upgrades script
    service unattended-upgrades restart
