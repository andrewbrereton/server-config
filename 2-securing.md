Securing
========

    # root
    sudo su
    
    # Create OpenSSH config
    rm /etc/ssh/sshd_config
    ln -s /root/server-config/files/etc/ssh/sshd_config /etc/ssh/sshd_config
    
    # Restart service
    service ssh restart
