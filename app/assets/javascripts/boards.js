$(document).ready(function() {
	$('.card-in-list').on('click', function(event) {
		$(event.target).find('a').click();
	});

	$('#label-select').on('click', function(event) {
		$('#ex1').modal({closeExisting: false});
		event.preventDefault();
	})
});