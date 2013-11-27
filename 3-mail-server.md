Mail Server
===========

    # root
    sudo su
    
    # Install Postfix
    apt-get install postfix mailutils
    # Configure for: Internet Site
    # System mail name: andrewbrereton.com
    
    # Create Postfix config
    rm /etc/postfix/main.cf
    ln -s /server-config/files/etc/postfix/main.cf /etc/postfix/main.cf
    
    # Create group for mail user
    groupadd -g 5000 vmail
    
    # Add mail user
    useradd -m -u 5000 -g 5000 -s /bin/bash vmail
    
    # Add domain
    rm /etc/postfix/vhosts
    ln -s /server-config/files/etc/postfix/vhosts /etc/postfix/vhosts
    
    # Add user
    rm /etc/postfix/vmaps
    ln -s /server-config/files/etc/postfix/vmaps /etc/postfix/vmaps
    
    # Create user database
    postmap /etc/postfix/vmaps
    
    # Verify user database
    ls -la /etc/postfix/vmaps.db
    
    # Start service
    service postfix start
    
    # Send test email. Press CTRL+D to send email
    mail andrew@andrewbrereton.com
    
    # Verify that email appears in user directory
    ls -la /home/vmail/andrewbrereton.com/andrew/new/
    
    # Install Dovecot
    apt-get install dovecot-imapd dovecot-pop3d
    
    # Stop Dovecot
    service dovecot stop
    
    # Get into the dir for keys
    cd /server-config && mkdir certs && cd certs
    
    # Generate a private key
    openssl genrsa -out andrewbrereton.com.key 1024
    
    # Generate a certificate request
    openssl req -nodes -newkey rsa:4096 -keyout andrewbrereton.com.key -out andrewbrereton.com.csr
    #Country Name (2 letter code) [AU]:AU
    #State or Province Name (full name) [Some-State]:Victoria
    #Locality Name (eg, city) []:.
    #Organization Name (eg, company) [Internet Widgits Pty Ltd]:.
    #Organizational Unit Name (eg, section) []:.
    #Common Name (e.g. server FQDN or YOUR name) []:*.andrewbrereton.com
    #Email Address []:andrew@andrewbrereton.com
    #A challenge password []:.
    #An optional company name []:.
    
    # Generate the certificate
    openssl x509 -req -days 3650 -in andrewbrereton.com.csr -signkey andrewbrereton.com.key -out andrewbrereton.com.crt
    
    # SASL for SMTP
    rm /etc/postfix/sasl/smtpd.conf
    ln -s /server-config/files/etc/postfix/sasl/smtpd.conf /etc/postfix/sasl/smtpd.conf
    
    # TLS cache
    mkdir /etc/postfix/tlscache
    chmod 755 /etc/postfix/tlscache
    
    # Dovecot users
    touch /etc/dovecot/users
    chmod 644 /etc/dovecot/users
    rm /etc/dovecot/users
    ln -s /server-config/files/etc/dovecot/users /etc/dovecot/users
    
    # Dovecot passwords
    touch /etc/dovecot/passwd
    chmod 644 /etc/dovecot/passwd
    
    # Generate password and store it in the passwd file
    echo "andrew@andrewbrereton.com:`doveadm pw`" > /etc/dovecot/passwd
    
    # Refresh aliases
    newaliases
    postalias /etc/aliases
    
    # 10-auth.conf
    rm /etc/dovecot/conf.d/10-auth.conf
    ln -s /server-config/files/etc/dovecot/conf.d/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
    
    # 10-mail.conf
    rm /etc/dovecot/conf.d/10-mail.conf
    ln -s /server-config/files/etc/dovecot/conf.d/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
    
    # 10-master.conf
    rm /etc/dovecot/conf.d/10-master.conf
    ln -s /server-config/files/etc/dovecot/conf.d/10-master.conf /etc/dovecot/conf.d/10-master.conf
    
    # 10-ssl.conf
    rm /etc/dovecot/conf.d/10-ssl.conf
    ln -s /server-config/files/etc/dovecot/conf.d/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf
    
    # auth-system.conf.ext
    rm /etc/dovecot/conf.d/auth-system.conf.ext
    ln -s /server-config/files/etc/dovecot/conf.d/auth-system.conf.ext /etc/dovecot/conf.d/auth-system.conf.ext
    
    # Test Dovecot by running it in the foreground to find any errors
    dovecot -F
    
    # Restart Dovecot
    service dovecot start
    
    # Thunderbird connection settings
    # http://i.imgur.com/ihWAwAQ.png
