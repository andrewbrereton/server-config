Securing
========

    # root
    sudo su

    # Pre-requisites
    apt-get update
    apt-get install fail2ban
    
    # Create OpenSSH config
    rm /etc/ssh/sshd_config
    ln -s /root/server-config/files/etc/ssh/sshd_config /etc/ssh/sshd_config
    
    # Restart service
    service ssh restart
