 

$(document).ready(function() {

	$('.menu-top-icon').click(function(){
			$('.top-container .sidebar-top').animate({
					'left':'0px'
			});
			$('body').animate({
				'left':'250px'
			});
			$('.btn-common-close').css('display','block');
			$('.top-container .sidebar-top .menu-top li ul li a').css('white-space','normal');
		});
		$('.btn-common-close').click(function(){
    		$('body').animate({
    			'left':'0px'
    		});
    		$('.top-container .sidebar-top').animate({
    			'left':'-250px'
    		});
    		$('.btn-common-close').css('display','none');
    	});
    	$('.top-container .sidebar-top .menu-top > li').click(function(){
    		if ($(this).hasClass('active')) {
    			$(this).find('> ul').css('display','none');
    			$(this).removeClass('active');
    		}else{
    			$(this).find('> ul').css('display','block');
    			$(this).addClass('active');
    		}
    	});    	
	

});

