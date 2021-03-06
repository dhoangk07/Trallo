$(document).ready(function() {
	$('#user-profile').webuiPopover({url:'#user-profile-content'});
	$('#icon-image').webuiPopover({url:'#icon-image-content'});
	$('#event-icon').webuiPopover({url:'#event-detail-content'});
	$('#member-icon').webuiPopover({url:'#member-invite-icon-content'});

	$('#cards-result').webuiPopover({url:'#cards-result-content', placement: "bottom"});

	$('#board-icon').webuiPopover({url:'#board-icon-content', placement: "bottom"});
	
	$('#statistics-icon').webuiPopover({url:'#statistics-icon-content', placement: "bottom"});
	
	$('#menu-icon').webuiPopover({url:'#menu-icon-content', placement: "bottom"});

})