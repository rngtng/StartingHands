<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Poker Starting Hands Calculator - Texas Hold'em</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  	<style type="text/css">
		@import url(style.css);
	</style>
	<script type="text/javascript" src="js/prototype.js"></script>
	<script type="text/javascript" src="js/behaviour.js"></script>
	<script type="text/javascript" src="js/myrules.js"></script>
 </head>
  <script>
    //init function to get Elements and set Default values
    var lngSetPos  = "<br>Set your Table Position<br>by clicking on the graypoints<br>";
    var lngSetOpp  = "Set Opponent and <br> the Button Position<br>by clicking on the graypoints<br>";
    {if isset($youNo)}
     var lngStart  = "<br><strong>Choose your Cards</strong><br><br>";
    {else} 
     var lngStart  = "<br><strong>Start the Game</strong><br><br>";
    {/if}
    function setAction( text )
    {ldelim}
            $("action").innerHTML = text;        
    {rdelim}

    init = function()
    {ldelim}
      f_pos   = $("f_pos"); 
      {if isset($youNo)}
         //set default values
         f_caller= $("callerno");
         f_caller.value = 0;
         // $( "late" ).onclick();
         $( "odd" ).onclick();
         $( "unraised" ).onclick();
         $( "p{$youNo}" ).onclick();
       {/if}
       {foreach from=$players item=playerNo}
           {if $playerNo != '' && $playerNo != $youNo}$( "p{$playerNo}" ).onclick();
           {/if}
       {/foreach}
       {if isset($buttonNo)}$( "b{$buttonNo}" ).onclick();{/if}
   {rdelim};
   
   Behaviour.addLoadEvent( init );
  </script>
 <body  bgcolor="#FFFFFF">
  <form action="index.php" method="post">
    <input type="hidden" name="formdata[card1]"  id="f_card1"  value="">
    <input type="hidden" name="formdata[card2]"  id="f_card2"  value="">
    <input type="hidden" name="formdata[suit]"   id="f_suit"   value="">
    <input type="hidden" name="formdata[you]"    id="f_you"    value="">
    <input type="hidden" name="formdata[button]" id="f_button" value="">
    <input type="hidden" name="formdata[raise]"  id="f_raise"  value="">
    <input type="hidden" name="formdata[players][0]"  id="f_player0"  value="">
    <input type="hidden" name="formdata[players][1]"  id="f_player1"  value="">
    <input type="hidden" name="formdata[players][2]"  id="f_player2"  value="">
    <input type="hidden" name="formdata[players][3]"  id="f_player3"  value="">
    <input type="hidden" name="formdata[players][4]"  id="f_player4"  value="">
    <input type="hidden" name="formdata[players][5]"  id="f_player5"  value="">
    <input type="hidden" name="formdata[players][6]"  id="f_player6"  value="">
    <input type="hidden" name="formdata[players][7]"  id="f_player7"  value="">
    <input type="hidden" name="formdata[players][8]"  id="f_player8"  value="">
    <input type="hidden" name="formdata[players][9]"  id="f_player9"  value="">
    <div id="calculator" background="img/bg.gif">
     <h1>Starting Hands Calculator</h1>
      <h2>Action:</h2>
      <div id="action"><br>Set your Table Position<br>by clicking on the gray points<br></div>
   {if isset($youNo)}   
      <div id="hand">
      <h2>Your Hand:</h2><span id="button"><a id="odd" href="#">odd</a><a id="suited" href="#">suited</a></span>
       <br clear="all" />
       <table width="200" border="0" cellpadding="0" cellspacing="0" id="cards">
         <tr>
           <td id="c1a"><img src="img/cards/c-A.gif" width="13" height="18" alt2="Ase" /></td>
           <td id="c1k"><img src="img/cards/c-K.gif" width="13" height="18" alt2="King" /></td>
           <td id="c1q"><img src="img/cards/c-Q.gif" width="13" height="18" alt2="Queen" /></td>
           <td id="c1j"><img src="img/cards/c-J.gif" width="13" height="18" alt2="Jack" /></td>
           <td id="c1t"><img src="img/cards/c-T.gif" width="13" height="18" alt2="10" /></td>
           <td id="c19"><img src="img/cards/c-9.gif" width="13" height="18" alt2="9" /></td>
           <td id="c18"><img src="img/cards/c-8.gif" width="13" height="18" alt2="8" /></td>
           <td id="c17"><img src="img/cards/c-7.gif" width="13" height="18" alt2="7" /></td>
           <td id="c16"><img src="img/cards/c-6.gif" width="13" height="18" alt2="6" /></td>
           <td id="c15"><img src="img/cards/c-5.gif" width="13" height="18" alt2="5" /></td>
           <td id="c14"><img src="img/cards/c-4.gif" width="13" height="18" alt2="4" /></td>
           <td id="c13"><img src="img/cards/c-3.gif" width="13" height="18" alt2="3" /></td>
           <td id="c12"><img src="img/cards/c-2.gif" width="13" height="18" alt2="2" /></td>
         </tr>
         <tr>
           <td id="c2a"><img src="img/cards/c-A.gif" width="13" height="18" alt2="Ase" /></td>
           <td id="c2k"><img src="img/cards/c-K.gif" width="13" height="18" alt2="King" /></td>
           <td id="c2q"><img src="img/cards/c-Q.gif" width="13" height="18" alt2="Queen" /></td>
           <td id="c2j"><img src="img/cards/c-J.gif" width="13" height="18" alt2="Jack" /></td>
           <td id="c2t"><img src="img/cards/c-T.gif" width="13" height="18" alt2="10" /></td>
           <td id="c29"><img src="img/cards/c-9.gif" width="13" height="18" alt2="9" /></td>
           <td id="c28"><img src="img/cards/c-8.gif" width="13" height="18" alt2="8" /></td>
           <td id="c27"><img src="img/cards/c-7.gif" width="13" height="18" alt2="7" /></td>
           <td id="c26"><img src="img/cards/c-6.gif" width="13" height="18" alt2="6" /></td>
           <td id="c25"><img src="img/cards/c-5.gif" width="13" height="18" alt2="5" /></td>
           <td id="c24"><img src="img/cards/c-4.gif" width="13" height="18" alt2="4" /></td>
           <td id="c23"><img src="img/cards/c-3.gif" width="13" height="18" alt2="3" /></td>
           <td id="c22"><img src="img/cards/c-2.gif" width="13" height="18" alt2="2" /></td>
         </tr>
       </table>
     </div>
     
     <div id="raise">
      <h2>Pot Status:</h2><span id="button"><a id="unraised" href="#">unraised</a><a id="raised" href="#">raised</a></span>
     </div>
     <br clear="all" />
     
     <div id="caller">
      <label for="callerno">Number of Callers: </label><div id="button"><a id="dec" href="#">-</a><input name="formdata[callerno]" id="callerno" value="0"><a id="inc" href="#">+</a></div>
     </div>
     <br clear="all" />
     
     <div id="next"><input type="submit" id="button" value="next Hand" /></div>
     
   {/if} 
     <div id="position">
      <h2>Your Table Position:</h2><input type="hiden" name="formdata[pos]" id="f_pos" size="7" value="???"><br clear="all" />
       {*<span id="button">
        <a style="width:38px" id="early"  href="#">early</a>
        <a style="width:46px" id="middle" href="#">middle</a>
        <a style="width:33px" id="late"   href="#">late</a>
        <a style="width:23px" id="sb"     href="#">sb</a>
        <a style="width:23px" id="bb"     href="#">bb</a></span>
      <br clear="all" /> *}
      
      <table id="table" width="196" border="0" cellpadding="0" cellspacing="0" background="img/table.gif">
        <tr>
          <td width="25" height="40" rowspan="2"          ><img src="img/s.gif" width="25" height="40" /></td>
          <th width="25" height="40" rowspan="2" class="p"><img src="img/p.gif" width="20" height="20" id="p9" alt2="Player #9" /></th>
          <td width="20" height="23"                      ><img src="img/s.gif" width="20" height="23" /></td>
          <th width="25" height="23"             class="p"><img src="img/p.gif" width="20" height="20" id="p0" alt2="Player #10" /></th>
          <td width= "5" height="40" rowspan="2"          ><img src="img/s.gif" width= "5" height="40" /></td>
          <th width="25" height="23"             class="p"><img src="img/p.gif" width="20" height="20" id="p1" alt2="Player #1" /></th>
          <td width="20" height="23"                      ><img src="img/s.gif" width="20" height="23" /></td>
          <th width="25" height="40" rowspan="2" class="p"><img src="img/p.gif" width="20" height="20" id="p2" alt2="Player #2" /></th>
          <td width="25" height="40" rowspan="2"          ><img src="img/s.gif" width="25" height="40" /></td>
          <td><img src="img/s.gif" width="1" height="23"/></td>
        </tr>
        <tr>                         
          <th width="20" height="17" class="b"><img src="img/s.gif" width="10" height="10" id="b9" alt2="Button #9" /></th>
          <th width="25" height="17" class="b"><img src="img/s.gif" width="10" height="10" id="b0" alt2="Button #0" /></th>
          <th width="25" height="17" class="b"><img src="img/s.gif" width="10" height="10" id="b1" alt2="Button #1" /></th>
          <th width="20" height="17" class="b"><img src="img/s.gif" width="10" height="10" id="b2" alt2="Button #9" /></th>
          <td width="20" height="17"><img src="img/s.gif" width="1" height="17"/></td>
        </tr>
        <tr>
          <th width="25" height="20"             class="p"><img src="img/p.gif" width="20" height="20" id="p8" alt2="Player #8" /></th>
          <th width="25" height="20"             class="b"><img src="img/s.gif" width="10" height="10" id="b8" alt2="Button #8" /></th>
          <td width="95" height="20" colspan="5"          ><img src="img/s.gif" width="95" height="20" /></td>
          <th width="25" height="20"             class="b"><img src="img/s.gif" width="10" height="10" id="b3" alt2="Button #3" /></th>
          <th width="25" height="20"             class="p"><img src="img/p.gif" width="20" height="20" id="p3" alt2="Player #3" /></th>
          <td><img src="img/s.gif" width="1" height="20"/></td>
        </tr>
        <tr>
          <td width="25" height="40" rowspan="2"          ><img src="img/s.gif" width="25" height="40" /></td>
          <th width="25" height="40" rowspan="2" class="p"><img src="img/p.gif" width="20" height="20" id="p7" alt2="Player #7" /></th>
          <th width="20" height="17"             class="b"><img src="img/s.gif" width="10" height="10" id="b7" alt2="Button #7" /></th>
          <th width="25" height="17"             class="b"><img src="img/s.gif" width="10" height="10" id="b6" alt2="Button #6" /></th>
          <td width= "5" height="40" rowspan="2"          ><img src="img/s.gif" width= "5" height="40" /></td>
          <th width="25" height="17"             class="b"><img src="img/s.gif" width="10" height="10" id="b5" alt2="Button #5" /></th>
          <th width="20" height="17"             class="b"><img src="img/s.gif" width="10" height="10" id="b4" alt2="Button #4" /></th>
          <th width="25" height="40" rowspan="2" class="p"><img src="img/p.gif" width="20" height="20" id="p4" alt2="Player #4" /></th>
          <td width="25" height="40" rowspan="2"          ><img src="img/s.gif" width="25" height="40" /></td>
          <td><img src="img/s.gif" width="1" height="17"/></td>
        </tr>
        <tr>
          <td width="20" height="23"        ><img src="img/s.gif" width="20" height="23" /></td>
          <th width="25" height="23" class="p"><img src="img/p.gif" width="20" height="20" id="p6" alt2="Player #6" /></th>
          <th width="25" height="23" class="p"><img src="img/p.gif" width="20" height="20" id="p5" alt2="Player #5" /></th>
          <td width="20" height="23"       ><img src="img/s.gif" width="20" height="23" /></td>
          <td><img src="img/s.gif" width="1" height="11"/></td>
        </tr>
       </table>
     </div>
   {if !$youNo}   
     <div id="next"><input type="submit" id="button" value="start Game" /></div>
    {/if}
    
    <a href="index.php">reset</a>
    
   </div>
  </form>
      
   <!-- table border="1" cellpadding="0" cellspacing="0" id="cards">
 <tr><td> <img src="img/p.gif" style="margin: 0px 10px 20px 40px"></td></tr></table -->
 
 </body>
</html>