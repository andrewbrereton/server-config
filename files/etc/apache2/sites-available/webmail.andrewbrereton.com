<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile /server-config/certs/andrewbrereton.com.crt
    SSLCertificateKeyFile /server-config/certs/andrewbrereton.com.key
    SSLCACertificateFile /server-config/certs/andrewbrereton.com.pem
    SSLProtocol all -SSLv2
    SSLCipherSuite ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM

    ServerName webmail.andrewbrereton.com

    DocumentRoot /var/www/webmail.andrewbrereton.com

    <Directory /var/www/webmail.andrewbrereton.com>
        Options +FollowSymLinks
        # This is needed to parse /var/www/webmail.andrewbrereton.com/.htaccess. See its
        # content before setting AllowOverride to None.
        AllowOverride All
        order allow,deny
        allow from all
    </Directory>

    # Protecting basic directories:
    <Directory /var/www/webmail.andrewbrereton.com/config>
        Options -FollowSymLinks
        AllowOverride None
    </Directory>

    <Directory /var/www/webmail.andrewbrereton.com/temp>
        Options -FollowSymLinks
        AllowOverride None
        Order allow,deny
        Deny from all
    </Directory>

    <Directory /var/www/webmail.andrewbrereton.com/logs>
        Options -FollowSymLinks
        AllowOverride None
        Order allow,deny
        Deny from all
    </Directory>
</VirtualHost>
