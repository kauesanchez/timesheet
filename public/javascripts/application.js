// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var ieversion = 0;

$(document).ready(function() {
	if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) 
 		ieversion=new Number(RegExp.$1);

	$(".toggle_grid").click(function(){
		$(".over_grid").toggle();
	});
});

function UpdateClock(){
	if(seconds == 60){
		seconds = 0;
		minutes += 1;
	}
	var print_seconds = seconds
	if(seconds < 10) print_seconds = '0'+ print_seconds
	$('#seconds').html(print_seconds);
	$('#minutes').html(minutes); 
}

function ClockStep(){
	seconds += 1;
	UpdateClock();
	self.setTimeout("ClockStep()", delay)
}

$( '.markable_item > label' ).click( function(){
	if(ieversion!=8){
		if ( $( this ).parent().hasClass('marked_item') )
		{
			$( this ).parent().removeClass('marked_item').addClass('markable_item');		
		}
		else
		{
			$('.marked_item').removeClass('marked_item').addClass('markable_item');
			$( this ).parent().removeClass('markable_item').addClass('marked_item');		
		}
	}
});

$( '.markable_item' ).click( function(){
	if ( $( this ).hasClass('marked_item') )
	{
		$( this ).removeClass('marked_item').addClass('markable_item');		
	}
	else
	{
		$( this ).find( 'input[type="radio"]' ).attr('checked' , 'checked');
		$('.marked_item').removeClass('marked_item').addClass('markable_item');
		$( this ).removeClass('markable_item').addClass('marked_item');		
	}
});

$( '.multiple_markable_item > label, .multiple_marked_item > label' ).click( function(){
	if(ieversion!=8){
		$( this ).parent().toggleClass( 'multiple_marked_item' );
		$( this ).parent().toggleClass( 'multiple_markable_item' );
	}
});

$( '.multiple_markable_item, .multiple_marked_item' ).click( function(){
	if ( $( this ).find( 'input[type="checkbox"]' ).attr('checked') != true )
		$( this ).find( 'input[type="checkbox"]' ).attr( 'checked' , true );
	else
		$( this ).find( 'input[type="checkbox"]' ).attr( 'checked' , false );
	$( this ).toggleClass( 'multiple_marked_item' );
	$( this ).toggleClass( 'multiple_markable_item' );
});