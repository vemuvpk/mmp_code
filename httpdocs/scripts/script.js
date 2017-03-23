/**
 * Created by Praveen on 22/08/15.
 */
/* affix the navbar after scroll below header */



$('#nav').affix({
    offset: {
        top: $('header').height()-$('#nav').height()
    }
});
