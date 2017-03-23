/**
 * Created by Praveen on 22/08/15.
 */
/* affix the navbar after scroll below header */



$('#nav').affix({
    offset: {
        top: $('header').height()-$('#nav').height()
    }
});

$('.UserLoggedIn').hide();
$('.UserLoggedOut').show();
$('.signUp').hide();

$('#messages').mouseover(function() {
	$('#messages .sub-menu').show();
});
$('#messages').mouseout(function() {
	$('#messages .sub-menu').hide();
});

$('#my_account').mouseover(function() {
	$('#my_account .sub-menu').show();
});
$('#my_account').mouseout(function() {
	$('#my_account .sub-menu').hide();
});


console.clear();