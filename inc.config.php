<?php
/*  
*                                      ***  S T A R T I N G  H A N D S  ***
*/
error_reporting( E_ALL );
define( 'ERROR_ECHO', true );

define( 'ADMIN_MAIL', 'info@starting-hands.com' );
define( 'DEBUG', false );

define( 'SITE_NAME', 8 );
define( 'SITE_URL', 'starting-hands.com' );
define( 'SITE_REALNAME', 'starting-hands.com' );

define( 'AUTHOR_LOGIN', '' );
define( 'TUTOR_LOGIN', '' );

## load global config file
# include_once(  dirname( dirname( __FILE__ ) ).'/inc.config.php' );
# 
# define( 'TEMPLATE_DIR', dirname( __FILE__ ).'/templates' );
# 
# $db = new PDO( 'mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASSWORD );
# $db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
# 
# ######################## MYSQL TABLES ##################################
# define( 'TABLE_SITES',       '38_8_cm_seiten' ); 
# define( 'TABLE_CONTENT',     '39_8_content' );
# define( 'TABLE_LOG',         'log' ); 
# 
# ################################################
# $pageI = new PageInfo( $db, 1 );
# $pageI->load( $_REQUEST );
# $pageI->clearRequest();
# 

################################################
define( 'CONFIG',  true );
?>
