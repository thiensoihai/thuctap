<?php
// HTTP
define('HTTP_SERVER', 'http://localhost:8081/pizza.com/');
// HTTPS
define('HTTPS_SERVER', 'http://localhost:8081/pizza.com/');

// DIR
define('APPLICATION', 'F:xampp\htdocs\pizza.com');
define('DIR_APPLICATION', APPLICATION.'/catalog/');
define('DIR_SYSTEM', APPLICATION.'/system/');
define('DIR_LANGUAGE', APPLICATION.'/catalog/language/');
define('DIR_TEMPLATE', APPLICATION.'/catalog/view/theme/');
define('DIR_CONFIG', APPLICATION.'/system/config/');
define('DIR_IMAGE', APPLICATION.'/image/');
define('DIR_CACHE', APPLICATION.'/system/cache/');
define('DIR_DOWNLOAD', APPLICATION.'/system/download/');
define('DIR_UPLOAD', APPLICATION.'/system/upload/');
define('DIR_MODIFICATION', APPLICATION.'/system/modification/');
define('DIR_LOGS', APPLICATION.'/system/logs/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'db_pizza_site');
define('DB_PORT', '3306');
define('DB_PREFIX', 'tbl_');
