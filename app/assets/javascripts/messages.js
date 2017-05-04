$(document).ready(function(){
    scroll_bottom();
})
function scroll_bottom() {
    var height = 0;
    $('#chat_area ul li').each(function(i, value){
        height += parseInt($(this).height());
    });

    height += '';

    $('#chat_area').animate({scrollTop: height + 50});
}