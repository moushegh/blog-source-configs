<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', getenv('RDS_DB_NAME'));

/** MySQL database username */
define('DB_USER', getenv('RDS_USERNAME'));

/** MySQL database password */
define('DB_PASSWORD', getenv('RDS_PASSWORD'));

/** MySQL hostname */
define('DB_HOST', getenv('RDS_HOSTNAME'));

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');


/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
/**
define('AUTH_KEY',         getenv('AUTH_KEY'));
define('SECURE_AUTH_KEY',  getenv('SECURE_AUTH_KEY'));
define('LOGGED_IN_KEY',    getenv('LOGGED_IN_KEY'));
define('NONCE_KEY',        getenv('NONCE_KEY'));
define('AUTH_SALT',        getenv('AUTH_SALT'));
define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT'));
define('LOGGED_IN_SALT',   getenv('LOGGED_IN_SALT'));
define('NONCE_SALT',       getenv('NONCE_SALT'));
**/

define('AUTH_KEY',         'tJ$tP|~7!u:[-@}xIE&iLV&3+|~P/H /jPptk;|fxh:zA+Z1J>? G}4M^cG^@Sus');
define('SECURE_AUTH_KEY',  'X4J0cj;xs8P)BO;t$)T+X[Rx*$~ri0h*}dVwCOy@$h-]8!3d+fSRGi-]IXNTS)&F');
define('LOGGED_IN_KEY',    'DtPkD`Nhg/8[e_1|ln:#{klu-EeBZ 4Q#+BSfa+igDaDTAs0(mXZ.`(sd?NHpj-D');
define('NONCE_KEY',        '9##Y(tp&ml[$>=rj?)UZQhalQ/Px:(,}x~Xy>8x-JaY_OYX-bV9|9XoDPBBvC@s-');
define('AUTH_SALT',        'GYPWPK[DjU2u4-eF>a=cuqk/UK&14449GK5RHYPt3Dy@+#U@fYdsob6Q.3kdj>}W');
define('SECURE_AUTH_SALT', 'rR-T~X*h- 3es+W,uuc2+h!K@IA~NXNf?X+VxL5 oNjW!I+1?>WC2e5. jkZ1|iX');
define('LOGGED_IN_SALT',   'Mt[|/.3jEgWFrFL9b,x~|8_pj<9;N/nOdxJPPmw#|4,t._~R+V!:!u]gvruVDycN');
define('NONCE_SALT',       'fV=hU7Ij[SiwZMwKiO]G1p;>l$N{h_3v(3J{heI f21(/@1?<#-I@+T_.Yz^dQhC');

$table_prefix  = getenv('wpprefix');

define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
