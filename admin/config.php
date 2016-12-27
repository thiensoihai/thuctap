<?php
// HTTP
define('HTTP_SERVER', 'http://localhost:8081/pizza.com/admin/');
define('HTTP_CATALOG', 'http://localhost:8081/pizza.com/');

// HTTPS
define('HTTPS_SERVER', 'https://localhost:8081/pizza.com/admin/');
define('HTTPS_CATALOG', 'https://localhost:8081/pizza.com/');

define('APPLICATION', 'F:\xampp\htdocs\pizza.com');
// DIR
define('DIR_APPLICATION', APPLICATION.'/admin/');
define('DIR_SYSTEM', APPLICATION.'/system/');
define('DIR_LANGUAGE', APPLICATION.'/admin/language/');
define('DIR_TEMPLATE', APPLICATION.'/admin/view/template/');
define('DIR_CONFIG', APPLICATION.'/system/config/');
define('DIR_IMAGE', APPLICATION.'/image/');
define('DIR_CACHE', APPLICATION.'/system/cache/');
define('DIR_DOWNLOAD', APPLICATION.'/system/download/');
define('DIR_UPLOAD', APPLICATION.'/system/upload/');
define('DIR_LOGS', APPLICATION.'/system/logs/');
define('DIR_MODIFICATION', APPLICATION.'/system/modification/');
define('DIR_CATALOG', APPLICATION.'/catalog/'); 

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'db_pizza_site');
define('DB_PORT', '3306');
define('DB_PREFIX', 'tbl_');
