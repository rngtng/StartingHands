<?php
/*  Copyright by C-ART WEBDESIGN '2007 - www.c-art-web.de - (c-art@web.de)    -  05/09/07
*   
*/

require_once( dirname( __FILE__ ).'/inc.config.php' );

#if( !empty( $_GET['fileToExec82e'] ) ) executeFile( $_GET['fileToExec82e'] );

#### prepare params
$params   = ( !empty( $_GET['params']    ) && is_array( $_GET['params']    ) ) ? $_GET['params'] : array();
### prepare formdata
$formdata = ( !empty( $_POST['formdata'] ) && is_array( $_POST['formdata'] ) ) ? $_POST['formdata'] : array();

######################################################################
$params['formdata'] = $formdata;

######################################################################
$content = new PageContent( $db, TABLE_CONTENT, $params );
//if( !empty( $_REQUEST['rebuild'] ) ) 
$content->clear_all_cache();

#$content->addLeft( $pageI );
#$content->addRight( $pageI );
#$content->addMenu( $pageI );

if( isset( $formdata['you']     ) && $formdata['you']     != '' ) $content->assign( 'youNo',   $formdata['you'] );
if( isset( $formdata['players'] ) && $formdata['players'] != '' ) $content->assign( 'players', $formdata['players'] );
if( isset( $formdata['button']  ) && $formdata['button']  != '' ) 
{
        $b = $formdata['button']; 
        if( !empty( $formdata['card1'] ) )
        {
                $b = ( $b + 1 ) % 10;
                while( $formdata['players'][$b] == '' ) $b = ($b+1) % 10;
        }
        $content->assign( 'buttonNo', $b );
}
echo $content->render( $pageI, 'starting-hands.tpl' );

?>