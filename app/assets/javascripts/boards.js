$(document).ready(function() {
	$('.card-in-list').on('click', function(event) {
		$(event.target).find('a').click();
	});

	$('.label-select').select2();
});