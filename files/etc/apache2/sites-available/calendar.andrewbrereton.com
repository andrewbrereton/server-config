<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile /root/certs/andrewbrereton.com.crt
    SSLCertificateKeyFile /root/certs/andrewbrereton.com.key
    SSLCACertificateFile /root/certs/andrewbrereton.com.pem
    SSLProtocol all -SSLv2
    SSLCipherSuite ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM

    ServerName www.calendar.andrewbrereton.com
    ServerAlias calendar.andrewbrereton.com
    ServerAdmin webmaster@andrewbrereton.com

    DocumentRoot /var/www/calendar.andrewbrereton.com/html

    DirectoryIndex index.php

    <Directory /var/www/calendar.andrewbrereton.com/html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Order allow,deny
        Allow from All
        <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^(.*)$ /index.php [QSA,L]
        </IfModule>
    </Directory>
</VirtualHost>
