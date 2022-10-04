/**
 * 
 */


	$(document).ready(function(){
		//사이드메뉴	   
	    $(window).scroll(function(){
	        if($(this).scrollTop()>=100){
	            $('aside').fadeIn();
	        }else{
	            $('aside').fadeOut();
	        }
	    });
	    $('#top_btn').click(function(e){
	        e.preventDefault();
	        $('html, body').stop().animate({scrollTop:0},500);
	    });

	     //상단메뉴 고정 
	     var $nav = $('nav');
	    $(window).scroll(function(){
	        if($(this).scrollTop()>0){
	            $nav.addClass('sticky');
	        }else{
	            $nav.removeClass('sticky');
	        }
	    });

	});

