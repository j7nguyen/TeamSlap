var playerRemove = function(rosterAddId, teamId) {
	$.ajax({
		url: ("" + teamId + "/roster_adds/" + rosterAddId),
		type: 'DELETE'
	});
}

var playerAdd = function(formData, teamId, playerId) {
	$.ajax({
		url: "/teams/" + teamId + "/roster_adds",
		type: 'POST',
		data: formData,
		success: function(response) {
			rosterUpdate(playerId, response.id);
			$('#option-' + playerId).remove();
		}
	});
}

var rosterUpdate = function(playerId, response_id) {
	$.ajax({
		url: "/users/" + playerId + '.json',
		type: 'GET',
		success: function(response) {
			var user = response;
			$('.roster').append(
				"<tr><td>" + user.first_name + 
				"</td><td>" + user.last_name +
				"</td><td>" + user.gender +
				"</td><td><button class='delete-player btn btn-danger btn-xs' value='" +
				response_id + "'>Delete Player</button></td></tr>"
			);
		}
	});
}

var playerToDropdown = function(playerId) {
	$.ajax({
		url: "/users/" + playerId + '.json',
		type: 'GET',
		success: function(response) {
			$('#available-players').append(
				"<option id='option-" + response.id + "' value='" + response.id + "'>" +
				response.first_name + " " + response.last_name + ", " + response.gender +
				"</option>"
			);
			}
		});
	}

