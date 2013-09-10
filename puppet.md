Puppet
=======

I am creating a standalone puppet deployment, not a server/agent deployment type.

Assumed Ubuntu 13.04 "Raring Ringtail". If different, modify repo paths.

    # admin
    sudo su
    
    # configure repo
    cd /tmp
    wget http://apt.puppetlabs.com/puppetlabs-release-raring.deb
    dpkg -i puppetlabs-release-raring.deb
    apt-get update
    
    # install
    apt-get install puppet-common
    
    # permanently start puppet
    puppet resource service puppet ensure=running enable=true
    
Continue with [configure-puppet](httpconfigure-puppet.md)
