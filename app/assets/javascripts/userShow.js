var chooseAvail = function(availId, userId) {
	$.ajax({
		url: "" + userId + "/availabilities/" + availId + ".json",
		type: 'GET',
		success: function(response) {
			// $('.editable-availability#' + availId).html(
			$('.modal-body').html(
				"<form class='edit-availability' role='form'>" +
				"<select class='form-control' name='avail[available_value]' id='player-availability'>" +
				"<option id='0' value=0>No Response</option>" +
				"<option id='1' value=1>Available</option>" +
				"<option id='2' value=2>Unavailable</option>" +
				"<option id='3' value=3>Maybe</option>" +
				"</select><input type='submit'  class='btn btn-xs btn-primary' value='Update Availability'></form>"
			);
			$('#player-availability option#'+response.available_value).attr('selected','selected');
			
			$('.edit-availability').on('submit', function(event) {
				var availValue = $('#player-availability').val()
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
			$('.editable-availability#' + availId).html(response.avail_string)
			}	
	});
}