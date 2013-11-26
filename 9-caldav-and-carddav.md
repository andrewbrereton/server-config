CalDAV and CardDAV
==================

    sudo apt-get update
    sudo apt-get install radicale

    # Allow Radicale to be started at boot
    rm /etc/default/radicale
    ln -s /root/server-config/files/etc/default/radicale /etc/default/radicale
    
    # Configuration
    rm /etc/radicale/config
    ln -s /root/server-config/files/etc/radicale/config /etc/radicale/config
    
    # Create the user file
    htpasswd -c -d /etc/radicale/users andrew
    # Enter password
    
    # Start the service
    /etc/init.d/radicale start
    
    # Create your calendar. Login using usernamd and password from htpasswd step
    # Navigate to https://andrewbrereton.com:5232/andrew/calendar.ics/
    
    # Create your address book
    # Navigate to https://andrewbrereton.com:5232/andrew/AddressBook.vcf/

On Android phone:

1. Download DAVdroid.
2. Create new DAVdroid account
3. Root URL: https://andrewbrereton.com:5232/andrew/
4. User name: andrew
5. Password: (Password that was used earlier to create htpasswd user)
6. Preemptive authentication: true
