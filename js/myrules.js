var card1 = null;
var card2 = null;
var suit = null;
var pos = null;
var raise = null;

var f_pos   =  null;
var f_caller= null;
var nr = 0;

var button = null;
var you = null;
var player = new Array;

var posNames = new Array( 'late', 'sb', 'bb', 'late', 'middle', 'middle', 'middle', 'early', 'early', 'early' );

function update() {
        if( !you ) return setAction( lngSetPos ) ;
        if( !button ) return setAction( lngSetOpp );
        if( !card1)   return setAction( lngStart );
        nr = (nr + 1 ) % 9; //max 9 unique requests
        new Ajax.Request( 'sh.php',
                {
                        method:'get',
                        parameters: { nr:nr, card1:card1.id.charAt(2), card2:card2.id.charAt(2), suit:suit.id.charAt(0), pos:f_pos.value, raise:raise.id, caller:f_caller.value },
                        onSuccess: function(transport) {
                                var response = transport.responseText;
                                if( response.charAt(0) == nr ) setAction( response.substring(1) );
                        },
                        onFailure: function() { alert('Something went wrong...') }
                } );
}

function updatePos()
{
        if( !you )    return setAction( lngSetPos ) ;
        if( !button ) return setAction( lngSetOpp );
        if( !card1)   setAction( lngStart );
        var offset = parseInt( button.id.charAt(1) ); 
        //search forward sb + bb
        var stop = offset;
        var add = 1;
        if( you == player[offset] ) return setPos( posNames[0] );
        var p = 1;
        for( var i = offset + 1 ; i != stop; i = (i+add) % 10 )
        {
                if( !player[i] ) continue;
                if( you == player[i] ) return setPos( posNames[p] );
                //alert( posNames[p] + ' at ' + i );
                p++;
                if( p == 3 ) { //switch to search backward
                        stop = i;
                        add = 9; //backward i-1 <==> (i+9) % 10
                        i = offset - 1 - 9;
                }
        }
}

function setPos( newpos )
{
        f_pos.value = newpos;  
        update();
}

var myrules = {
        '#hand A' : function(el) {
                el.onclick = function() {
                        if( this.selected ) return;
                        if( suit && suit.id == "odd" && card1 && card1.id.charAt(2) == card2.id.charAt(2) ) return;
                        if( suit ) suit.toggle2();
                        suit = this;
                        this.toggle2();
                        update();
                        $("f_suit").value = suit.id.charAt(0);
                        if( !card1 ) return;
                        if( ( suit.id == "odd" && card1.id.charAt(1) == card2.id.charAt(1) ) || ( suit.id == "suited" && card1.id.charAt(1) != card2.id.charAt(1) ) ) 
                        {
                                var id = 'c' + ( 3 - card1.id.charAt(1) ) + card1.id.charAt(2);
                                if( id == card2.id ) return;
                                $( id ).onclick();
                        }
                };
                el.onmouseover = function() {
                        if( !this.selected ) this.className = "hover";
                };
                el.onmouseout = function() {
                        if( !this.selected ) this.className = "";
                };
                el.toggle2 = function() {
                        this.selected = !this.selected;
                        this.className = ( this.selected ) ? "selected" : ""; 
                };  
        },
        '#cards TD' : function(el) {
                el.onclick = function() {
                        if( this.selected ) return;
                        if( card1 ) card1.toggle2();
                        card1 = card2;
                        card2 = this;
                        card2.toggle2();
                        update();
                        $("f_card2").value = card2.id.charAt(2);
                        if( !card1 ) return;
                        $("f_card1").value = card1.id.charAt(2);
                        if( card1.id.charAt(1) != card2.id.charAt(1) && suit.id != "odd" ) $( "odd" ).onclick();
                        if( card1.id.charAt(1) == card2.id.charAt(1) && suit.id == "odd" ) $( "suited" ).onclick();
                };
                el.onmouseover = function() {
                        if( !this.selected ) this.className = "hover";
                };
                el.onmouseout = function() {
                        if( !this.selected ) this.className = "";
                };
                el.toggle2 = function() {
                        this.selected = !this.selected;
                        this.className = ( this.selected ) ? "selected" : ""; 
                }; 
        },
        '#table TH.p IMG' : function(el) {
                el.onclick = function() {
                        player[this.id.charAt(1)] = ( !this.selected ) ? this : null;
                        if( !you || you == this ) you = player[this.id.charAt(1)];
                        $( "f_you").value = ( you ) ? you.id.charAt(1) : '';
                        $( "f_player"+this.id.charAt(1) ).value = ( player[this.id.charAt(1)] ) ? this.id.charAt(1) : '';
                        var but = $( "b" + this.id.charAt(1) );
                        (player[this.id.charAt(1)] ) ? but.turnOn() : but.turnOff();
                        this.toggle2();
                        updatePos();
                };
                el.onmouseover = function() {
                        var nr = ( !you  ) ? "y" : "p";
                        if( !this.selected ) this.src = "img/" + nr + "o.gif";
                };
                el.onmouseout = function() {
                        if( !this.selected ) this.src = "img/p.gif";
                };
                el.toggle2 = function() {
                        this.selected = !this.selected;
                        var nr = ( you == this ) ? "y" : "p";
                        this.src = ( this.selected ) ? "img/" + nr + "s.gif" : "img/p.gif";
                };
        },
        '#table TH.b IMG' : function(el) {
                el.onclick = function() {
                        if( this.selected || !this.on ) return;
                        if( button ) button.toggle2();
                        button = this;
                        $("f_button").value = button.id.charAt(1);
                        this.toggle2();
                        updatePos();
                };
                el.onmouseover = function() {
                        if( !this.on ) return;
                        if( !this.selected ) this.src = "img/bo.gif";
                };
                el.onmouseout = function() {
                        if( !this.on ) return;
                        if( !this.selected ) this.src = "img/b.gif";
                };
                el.toggle2 = function() {
                        this.selected = !this.selected;
                        this.src = ( this.selected ) ? "img/bs.gif" : "img/b.gif";
                };
                el.turnOn = function() {
                        this.on = true;
                        this.src = "img/b.gif";
                };
                el.turnOff = function() {
                        this.on = false;
                        this.selected = false;
                        this.src = "img/spacer.gif";
                        if( button == this ) button = null;
                };
        },
        '#position A' : function(el) {
                el.onclick = function() {
                        if( this.selected ) return;
                        if( pos ) pos.toggle2();
                        pos = this;
                        this.toggle2();
                        setPos( pos.id ); //includes update();
                };
                el.onmouseover = function() {
                        if( !this.selected ) this.className = "hover";
                };
                el.onmouseout = function() {
                        if( !this.selected ) this.className = "";
                };
                el.toggle2 = function() {
                        this.selected = !this.selected;
                        this.className = ( this.selected ) ? "selected" : ""; 
                };  
        }, 
        '#raise A' : function(el) {
                el.onclick = function() {
                        if( this.selected ) return;
                        if( raise ) raise.toggle2();
                        raise = this;
                        this.toggle2();
                        update();
                        $("f_raise").value = raise.id;
                };
                el.onmouseover = function() {
                        if( !this.selected ) this.className = "hover";
                };
                el.onmouseout = function() {
                        if( !this.selected ) this.className = "";
                };
                el.toggle2 = function() {
                        this.selected = !this.selected;
                        this.className = ( this.selected ) ? "selected" : ""; 
                };  
        },
        '#caller A' : function(el) {
                el.onclick = function() {
                        this.className = "selected";
                        if( this.id.charAt(0) == "d" && f_caller.value >  0 ) f_caller.value--;
                        if( this.id.charAt(0) == "i" && f_caller.value < 10 ) f_caller.value++;
                        update();
                };
                el.onmouseover = function() {
                        if( !this.selected ) this.className = "hover";
                };
                el.onmouseout = function() {
                        if( !this.selected ) this.className = "";
                };
        }
};

Behaviour.register(myrules);
