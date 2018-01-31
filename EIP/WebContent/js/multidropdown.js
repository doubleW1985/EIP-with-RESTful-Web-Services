// https://www.minwt.com/webdesign-dev/html/16998.html

$(function(){
      $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
        //點擊時避免跟隨href位置
        event.preventDefault();
         //避免在點擊時關閉菜單
        event.stopPropagation();
        if($(this).parent().hasClass('open') == false){ //當class=open為否時
          $(this).parent().addClass('open');
        }else{
          $(this).parent().removeClass('open');
        }
    });
});