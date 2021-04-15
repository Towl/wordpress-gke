<?php
define('WP_CACHE', true);

define('DB_NAME', getenv('WORDPRESS_DATABASE_NAME'));
define('DB_USER', getenv('WORDPRESS_DATABASE_USER'));
define('DB_PASSWORD', getenv('WORDPRESS_DATABASE_PASSWORD'));
define('DB_HOST', getenv('MARIADB_HOST').':'.getenv('MARIADB_PORT_NUMBER'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('MYSQL_CLIENT_SSL', true);
define('MYSQL_CLIENT_FLAGS', MYSQLI_CLIENT_SSL|MYSQLI_CLIENT_SSL_DONT_VERIFY_SERVER_CERT);
define('MYSQL_SSL_KEY', '/bitnami/certs/client-key.pem');
define('MYSQL_SSL_CERT', '/bitnami/certs/client-cert.pem');
define('MYSQL_SSL_CA', null);
define('MYSQL_SSL_CAPATH', '/bitnami/certs');
define('MYSQL_SSL_CIPHER', null);

if ( ! defined( 'ABSPATH' ) ) {
  define('ABSPATH', '/opt/bitnami/wordpress' . '/');
}

require_once '/bitnami/keys/keys.php';

$table_prefix = getenv('WORDPRESS_TABLE_PREFIX');

if ( defined('WP_CLI') ) {
  $_SERVER['HTTP_HOST'] = '127.0.0.1';
}

define('WP_DEBUG', getenv('WORDPRESS_DEBUG'));
define('WP_PLUGIN_DIR', ABSPATH . 'wp-content/plugins');
define('WP_SITEURL', 'http://' . $_SERVER['HTTP_HOST'] . '/');
define('WP_HOME', 'http://' . $_SERVER['HTTP_HOST'] . '/');
define('FS_METHOD', 'direct');

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

define('WP_TEMP_DIR', '/opt/bitnami/wordpress/tmp');

if ( !defined( 'WP_CLI' ) ) {
// remove x-pingback HTTP header
add_filter("wp_headers", function($headers) {
            unset($headers["X-Pingback"]);
            return $headers;
           });
// disable pingbacks
add_filter( "xmlrpc_methods", function( $methods ) {
             unset( $methods["pingback.ping"] );
             return $methods;
           });
}
