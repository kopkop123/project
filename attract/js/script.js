$(function() {
    $(document).ready(function() {
    	$('.item').hover(
    		function() {
    			$(this).find('.item-type').animate({
    				top: '0',
    				right: '0'
    			},500);
    		},
    		function() {
    			$(this).find('.item-type').animate({
    				top: '150px',
    				right: '250px'
    			},500);
    		}
    	);
    });
});