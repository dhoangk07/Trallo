$(document).ready(function() {
	$('#list').on('click', '.card-in-list', function(event) {
		$(event.target).find('a').click();
	});

	$('#label-select').on('click', function(event) {
		$('#ex1').modal({closeExisting: false});
		event.preventDefault();
	})

	$('.draggable').draggable({
		containment: $('#list'),
		helper: 'clone'
	});
	$('.droppable').droppable({
		drop: function(event, ui) {
			$(event.target).find('.cards').append(ui.draggable)
			var listId = $(ui.draggable.parents('.list-column')).data('list-id');
			var cardId = $(ui.draggable).data('card-id');
			$.ajax({
				method: 'PUT',
				url: '/lists/' + listId + '/cards/' + cardId + '/drop_card',
				data: { 
					card: 
					  { list_member_id: $(event.target).data('list-id') }
			    }
			})
		}
	});

	 $('select').niceSelect();
});