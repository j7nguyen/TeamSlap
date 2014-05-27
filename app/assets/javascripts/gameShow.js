var newLineup = function(gameId, teamId) {
	$.ajax({
		url: "/teams/" + teamId + "/lineups",
		type: "POST",
		data: { lineup: {
			game_id: gameId,
			team_id: teamId
		}},
		success: function(response) {
			window.location.href = ("/teams/" + teamId + "/lineups/" + response.id)
		}
	});
}
