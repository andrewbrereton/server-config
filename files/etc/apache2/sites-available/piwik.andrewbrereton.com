#<VirtualHost *:80>
#    ServerName piwik.andrewbrereton.com
#    Redirect permanent / https://piwik.andrewbrereton.com/
#</VirtualHost>

<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile /root/certs/andrewbrereton.com.crt
    SSLCertificateKeyFile /root/certs/andrewbrereton.com.key
    SSLCACertificateFile /root/certs/andrewbrereton.com.pem
    SSLProtocol all -SSLv2
    SSLCipherSuite ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM

    ServerName piwik.andrewbrereton.com
    ServerAdmin webmaster@piwik.andrewbrereton.com

    DocumentRoot /var/www/piwik.andrewbrereton.com

    <Directory />
        Options FollowSymLinks
        AllowOverride None
    </Directory>

    <Directory /var/www/piwik.andrewbrereton.com>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Order allow,deny
        allow from all
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log

    LogLevel warn

    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
