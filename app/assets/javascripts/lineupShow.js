var newPosition = function(name, teamId, lineupId) {
	$.ajax({
		url: "/teams/" + teamId + "/lineups/" + lineupId + "/lineup_positions",
		type: "POST",
		data: { position: {
			name: name,
			lineup_id: lineupId
		}},
		success: function(response) {
			$('#positions').append("<div class='lineup-position' id='" +
			response.id +"'>" + response.name + "</div>");
			$('#positionName').val('');
		}
	});
}