XMPP
----
    
    # Sudo
    sudo su
    
    # Pre-requisites
    apt-get install ejabberd
    
    # Copy over custom init script
    rm /etc/init.d/ejabberd
    ln -s /root/server-config/files/etc/init.d/ejabberd /etc/init.d/ejabberd
    chmod 777 /root/server-config/files/etc/init.d/ejabberd

    # Copy over config
    rm /etc/ejabberd/ejabberd.conf
    ln -s /root/server-config/files/etc/ejabberd/ejabberd.conf /etc/ejabberd/ejabberd.conf
    
    # Kill any existing running instances
    ps aux|grep -i ejabberd
    kill ?
    
    # Test
    /etc/init.d/ejabberd live
    
    # If OK, quit that and start proper
    /etc/init.d/ejabberd start
    
    # Register user
    ejabberdctl register andrew andrewbrereton.com SUPERSECUREPASSWORD
