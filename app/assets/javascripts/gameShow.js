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

var editResult = function(gameId, leagueId) {
	
	$.ajax({
		url: '/leagues/' + leagueId + '/games/' + gameId + '.json',
		type: 'GET',
		success: function(response) {
					$('.result#' + gameId).html("<input id='score1' type='text' size='1' maxlength='2' value=" +
					response.team1_score + ">-<input id='score2' type='text' size='1' maxlength='2' value='" +
					response.team2_score + "'><br><input type='submit' id='update' value='update'>");
					
					
					$('#update').on('click', function() {
						var score1 = $('#score1').val();
						var score2 = $('#score2').val();
						
						updateResult(leagueId, gameId, score1, score2);
					});
		}
	});
}

var updateResult = function(leagueId, gameId, score1, score2) {
	$.ajax({
		url: '/leagues/' + leagueId + '/games/' + gameId,
		type: 'PATCH',
		data: { game: {
			team1_score: score1,
			team2_score: score2
		}},
		success: function(response) {
			$('.result#' + gameId).text("" + response.team1_score + "-" + response.team2_score);
		}
	})
}

	// $.ajax({
	// 	url: ,
	// 	type: "PATCH",
	// 	data: { result: {
	// 		game_id: gameId,
	// 		team1_score: score1,
	// 		team2_score: score2
	// 	}},
	// 	success: function(response) {
	// 		$('.result#' + gameId).text(response.result);
	// 	}
	// })
