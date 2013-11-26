<?php
// vim: ft=php

$config['caldav_http_auth_method'] = null;
$config['caldav_base_url'] = 'https://andrewbrereton.com:5232';
$config['caldav_principal_template'] = '/%u/';
$config['caldav_calendar_homeset_template'] = '/%u/';
$config['caldav_public_base_url'] = 'https://public.server';
$config['enable_calendar_sharing'] = true;
$config['permissions'] = array(
    // Permissions for calendar owner
    'owner' => array(
        array('DAV:', 'all'),
        array('DAV:', 'read'),
        array('DAV:', 'unlock'),
        array('DAV:', 'read-acl'),
        array('DAV:', 'read-current-user-privilege-set'),
        array('DAV:', 'write-acl'),
        array('urn:ietf:params:xml:ns:caldav', 'read-free-busy'),
        array('DAV:', 'write'),
        array('DAV:', 'write-properties'),
        array('DAV:', 'write-content'),
        array('DAV:', 'bind'),
        array('DAV:', 'unbind'),
    ),

    // Permissions for sharing calendars using the 'read' profile
    'read' => array(
        array('DAV:', 'read'),
        array('urn:ietf:params:xml:ns:caldav', 'read-free-busy'),
    ),

    // Permissions for sharing calendars using the 'read+write' profile
    'read_write' => array(
        array('DAV:', 'read'),
        array('DAV:', 'write'),
        array('urn:ietf:params:xml:ns:caldav', 'read-free-busy'),
    ),

    // Authenticated users default permissions
    'default' => array(
        array('urn:ietf:params:xml:ns:caldav', 'read-free-busy'),
    )
);
