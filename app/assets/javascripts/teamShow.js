var playerRemove = function(rosterAddId, teamId) {
	$.ajax({
		url: ("" + teamId + "/roster_adds/" + rosterAddId),
		type: 'DELETE',
	});
}

var playerAdd = function(formData, teamId) {
	$.ajax({
		url: "/teams/" + teamId + "/roster_adds",
		type: 'POST',
		data: formData
		
	});
}