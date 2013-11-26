<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// Advanced options which you should not need to modify
require_once('advanced.php');

// Defaults
require_once('defaults.php');

$config['base_url']	= 'https://calendar.andrewbrereton.com/';
$config['log_path'] = '';
$config['enable_debug']= FALSE;
$config['encryption_key'] = 'ASasdkdkdk';
$config['cookie_prefix']	= "";
$config['cookie_domain']	= "calendar.andrewbrereton.com";
$config['cookie_path']		= "/";
$config['cookie_secure']	= TRUE;
$config['proxy_ips'] = '';
$config['site_title'] = 'Calendar web access for andrewbrereton.com';
$config['logo'] = 'agendav_100transp.png';
$config['footer'] = 'andrewbrereton.com';
$config['logout_redirect_to'] = '';
$config['additional_js'] = array();
$config['show_public_caldav_url'] = TRUE;
$config['default_language']	= 'en';
$config['default_time_format'] = '24';
$config['default_date_format'] = 'ymd';
$config['default_first_day'] = 1;
$config['default_timezone'] = 'Australia/Melbourne';
$config['calendar_colors'] = array(
		'D4EAEF',
		'3A89C9',
		'107FC9',
		'FAC5C0',
		'FF4E50',
		'BD3737',
		'C9DF8A',
		'77AB59',
		'36802D',
		'F8F087',
		'E6D5C1',
		'3E4147',
);


/* End of file config.php */
/* Location: ./application/config/config.php */
