$(document).ready(function() {
	$('#list').on('click', '.card-in-list', function(event) {
		$(event.target).find('a').click();
	});

	$('#label-select').on('click', function(event) {
		$('#ex1').modal({closeExisting: false});
		event.preventDefault();
	})
});