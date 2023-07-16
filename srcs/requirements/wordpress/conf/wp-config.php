<?php
// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( "DB_NAME", getenv("MARIADB_DATABASE"));

/** Database username */
define( "DB_USER", getenv("MARIADB_USER"));

/** Database password */
define( "DB_PASSWORD", getenv("MARIADB_USER_PASS"));

/** Database hostname */
define( "DB_HOST", getenv("MARIADB_HOST") . ":3306");
#define( "DB_HOST', "127.0.0.1:3306");

/** Database charset to use in creating database tables. */
define( "DB_CHARSET", getenv("MARIADB_CHARSET"));

/** The database collate type. Don't change this if in doubt. */
define( "DB_COLLATE", getenv("MARIADB_COLLATION"));

define( 'AUTH_KEY',          getenv("WP_AUTH_KEY"));
define( 'SECURE_AUTH_KEY',   getenv("WP_SECURE_AUTH_KEY"));
define( 'LOGGED_IN_KEY',     getenv("WP_LOGGED_IN_KEY"));
define( 'NONCE_KEY',         getenv("WP_NONCE_KEY"));
define( 'AUTH_SALT',         getenv("WP_AUTH_SALT"));
define( 'SECURE_AUTH_SALT',  getenv("WP_SECURE_AUTH_SALT"));
define( 'LOGGED_IN_SALT',    getenv("WP_LOGGED_IN_SALT"));
define( 'NONCE_SALT',        getenv("WP_NONCE_SALT"));

/**#@-*/

# === BONUS - redis
// adjust Redis host and port if necessary 
define( 'WP_REDIS_HOST', getenv("REDIS_HOST") );
define( 'WP_REDIS_PORT', getenv("REDIS_PORT"));

// change the prefix and database for each site to avoid cache data collisions
define( 'WP_REDIS_PREFIX', getenv("WP_DOMAIN") );
define( 'WP_REDIS_DATABASE', 0 ); // 0-15

// reasonable connection and read+write timeouts
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );

define('WP_CACHE', true);
define('WP_CACHE_KEY_SALT', 'inception');

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
