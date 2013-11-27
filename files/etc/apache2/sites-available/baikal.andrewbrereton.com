<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile /server-config/certs/andrewbrereton.com.crt
    SSLCertificateKeyFile /server-config/certs/andrewbrereton.com.key
    SSLCACertificateFile /server-config/certs/andrewbrereton.com.pem
    SSLProtocol all -SSLv2
    SSLCipherSuite ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM

    ServerName www.baikal.andrewbrereton.com
    ServerAlias baikal.andrewbrereton.com
    ServerAdmin webmaster@andrewbrereton.com

    DocumentRoot /var/www/baikal.andrewbrereton.com/html

    DirectoryIndex index.php

    <Directory /var/www/baikal.andrewbrereton.com/html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from All
        <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^(.*)$ /index.php [QSA,L]
        </IfModule>
    </Directory>
</VirtualHost>
