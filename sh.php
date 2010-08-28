<?php

define( 'FOLD',    'Fold' );
define( 'CALL',    'Call' );
define( 'RAISE',   'Raise' );
define( 'DIFF1',   ';' );
define( 'DIFF2',   '/' );
define( 'DIFF3',   ' ' );
define( 'COMMENT', '#' );
define( 'UNRAISED', 'unraised' );
define( 'RAISED', 'raised' );
define( 'ANY', '*' );
define( 'MAX_CALLER', 9 );

$raise = array( UNRAISED, RAISED );
$pos = array( 'early', 'middle', 'late', 'sb', 'bb' );

foreach( file( 'data.txt' ) AS $line )
{
        if( strstr( $line, COMMENT ) ) continue;
        $positions = explode( DIFF1, $line );
        $hand = strtolower( array_shift( $positions ) );
        $r = array();
        foreach( $positions AS $position => $action ) //$early, $middle, $late, $sb, $bb
        {
                $posName = $pos[$position];
                if( !strstr( $action, DIFF2 ) ) $action .= DIFF2.FOLD;
                $raises = explode( DIFF2, $action );
                foreach( $raises AS $r => $action ) // $unraised, $raised
                {
                        $raiseName = $raise[$r];
                        @list( $action, $nr ) = explode( DIFF3, $action );
                        if( empty( $nr ) ) $nr = 0;
                        $f_action = $action;
                        $res[$hand][$posName][$raiseName][ANY] = $nr; //"$f_action if caller $limit $nr";
                        for( $caller = 0; $caller <= MAX_CALLER; $caller++ )
                        {
                                if( !empty( $nr ) && $f_action == CALL  ) $action = ( $caller > $nr ) ? $f_action : FOLD; //Call=X+1 oder mehr
                                if( !empty( $nr ) && $f_action == RAISE ) $action = ( $caller > $nr ) ? CALL : $f_action; //Raise=X oder weniger
                                $res[$hand][$posName][$raiseName][$caller] = $action;
                        }
                }
        }
}

unset( $raise );
unset( $pos );

if( empty( $_GET['nr'] ) ) 
{
        echo "<pre>"; 
        print_r( $res['jto'] );
        exit;
}

$action = "";
$extra1 = "";
$extra2 = "";
$nr     = $_GET['nr'];
$card1  = $_GET['card1'];
$card2  = $_GET['card2'];
$suit   = $_GET['suit'];
$card = $card1.$card2.$suit;
if( empty( $res[$card] ) ) $card = $card2.$card1.$suit;
if( empty( $res[$card] ) ) 
{
        $action = FOLD;
}
else 
{
        $pos      = $_GET['pos'];
        $raise    = $_GET['raise'];
        $caller   = $_GET['caller'];
        if( $caller < 0 ) $caller = 0;
        if( $caller > MAX_CALLER ) $caller = MAX_CALLER;
        $resL = $res[$card][$pos];
        $action = $resL[$raise][$caller];
        if( $raise == UNRAISED && $resL[RAISED][$caller] != $action ) $extra1 = "On raise: ".$resL[RAISED][$caller];
        $l = $resL[$raise][ANY]+1;
        if( $l > $caller &&  $resL[$raise][$l] != $action ) $extra2 = "On $l or more caller: ".$resL[$raise][$l];
        
}
echo "$nr";
//echo "$card $pos $raise $caller<br>";
if( empty( $extra2 ) ) echo "<br>";
echo "<strong>$action</strong><br>$extra1<br>$extra2";

?>
