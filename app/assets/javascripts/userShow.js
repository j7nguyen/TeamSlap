var chooseAvail = function(availId, userId) {
	$.ajax({
		url: "" + userId + "/availabilities/" + availId + ".json",
		type: 'GET',
		success: function(response) {
			// $('.editable-availability#' + availId).html(
			$('#'+ availId).html(
				"<div class='avail-selection' id='" + availId + "'><form class='edit-availability' role='form'>" +
				"<select class='form-control player-availability' name='avail[available_value]' id='" + availId + "'>" +
				"<option id='0' value=0>No Response</option>" +
				"<option id='1' value=1>Available</option>" +
				"<option id='2' value=2>Unavailable</option>" +
				"<option id='3' value=3>Maybe</option>" +
				"</select><input type='submit'  class='btn btn-xs btn-primary update-avail-btn' " + 
				"value='Update Availability'></form></div>"
			);

			var availValue = response.available_value;

			$('.player-availability').find('#' + availValue).attr('selected','selected');
			
			$('.edit-availability').on('submit', function(event) {
				event.preventDefault();
				var availValue = $('.player-availability ').val();

				updateAvail(userId, availId, availValue);
			});
		}
	});
}

var updateAvail = function(userId, availId, availValue) {
	$.ajax({
		url: ("" + userId + "/availabilities/" + availId),
		type: 'PATCH',
		data: {avail: {player_id: userId, available_value: availValue}},
		success: function(response) {
			$('.editable-availability#' + response.id).html(response.avail_button);

			$('.avail-button').on('click', function() {
				var availId = $(this).parent()[0].id;
				chooseAvail(availId, userId);
			});
			}
	});
}

