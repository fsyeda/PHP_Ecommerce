<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$route['default_controller'] = "main";
$route['home'] = "main/home";
$route['update_cart/(:any)'] = "products/update_cart/$1";
$route['google/(:any)/(:any)'] = "products/google/$1/$2";
$route['meet_the_team'] = "main/meet_the_team";
$route['contact_us'] = "main/contact_us";
$route['careers'] = "main/careers";
$route['FAQs'] = "main/FAQs";
$route['404_override'] = '';

//end of routes.php