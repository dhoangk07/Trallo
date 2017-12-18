$(document).ready(function() {
	

	$('.toggle-down').each(function(index, element) {
	  var linkId = $(element).attr('id');
	  var toggledownId = $(element).siblings('.toggle-down-icon').attr('id');

	  $('#' + linkId).webuiPopover({url: '#' + toggledownId});
	  	
	})
	
})