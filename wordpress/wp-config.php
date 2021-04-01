<?php
define('DB_NAME', getenv('WORDPRESS_DATABASE_NAME'));
define('DB_USER', getenv('WORDPRESS_DATABASE_USER'));
define('DB_PASSWORD', getenv('WORDPRESS_DATABASE_PASSWORD'));
define('DB_HOST', getenv('MARIADB_HOST').':'.getenv('MARIADB_PORT_NUMBER'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('MYSQL_CLIENT_FLAGS', MYSQLI_CLIENT_SSL);

if ( ! defined( 'ABSPATH' ) ) {
  define('ABSPATH', '/opt/bitnami/wordpress' . '/');
}

require_once ABSPATH . 'keys.php';

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
