Puppet Configuration
====================

    sudo su
    
    # ntp module
    puppet module install puppetlabs/ntp
    
    # apache module
    puppet module install puppetlabs/apache

    # get this repo
    cd ~
    git clone https://github.com/andrewbrereton/server-config.git

    # install the repo's puppet configs
    ln -s ~/server-config/puppet-modules/manifests/site.php /etc/puppet/manifests/site.php
