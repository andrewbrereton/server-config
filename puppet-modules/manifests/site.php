class { 'apache': 
    default_vhost => false,
}

class { 'apache::mod::pagespeed':
    domain_names => 'http://andrewbrereton.com https://andrewbrereton.com',
}

class { 'apache::mod::php': }

class { 'apache::mod::ssl': }

apache::mod { 'rewrite': }

apache::vhost { 'andrewbrereton.com':
    priority      => '10',
    port          => '443',
    template      => 'apache/vhost-symfony.conf.erb',
    ssl           => true,
    docroot       => '/var/www/andrewbrereton.com/web',
    logroot       => '/var/log/apache2',
    options       => 'FollowSymLinks',
    override      => 'All',
    serveradmin   => 'webmaster@andrewbrereton.com',
    serveraliases => 'www.andrewbrereton.com',
    docroot_owner => 'www-data',
    docroot_group => 'www-data',
    ssl_cert      => '/etc/ssl/certs/andrewbrereton.com.crt',
    ssl_key       => '/etc/ssl/certs/andrewbrereton.com.key',
}
