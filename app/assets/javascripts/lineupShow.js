var newPosition = function(name, teamId, lineupId) {
	$.ajax({
		url: "/teams/" + teamId + "/lineups/" + lineupId + "/lineup_positions",
		type: "POST",
		data: { position: {
			name: name,
			lineup_id: lineupId
		}},
		success: function(response) {
			$('#sortable-positions').append("<li><div class='row lineup-position' id='" +
			response.id +"'><div class='lineup-description col col-xs-5'>" + response.name + 
			"</div><div class='lineup-assignment col col-xs-7 droppable ui-widget-header ui-droppable' id='" +
			response.id + "'></div>" +
			"</div></li>");
			
			$(function() {
					$( ".draggable" ).draggable({containment: '.lineup-maker', revert: 'invalid',
						cursor: 'move', zIndex: 1000 });
					$( ".droppable" ).droppable({ 
						drop: function( event, ui ) {
							console.log(this);
					 	$( this ).addClass( "assigned");
						var playerId = ui.draggable[0].id;
						var positionId = event.target.id;
						assignPosition(positionId, playerId, lineupId);
					  },
					});

					$('.lineup-position#' + response.id).on('dblclick', function() {
						var lineupId = lineupId;
						unassign(this.id, lineupId);
					});
						
			});
			$('#positionName').val('');
		}
	});
}

var assignPosition = function(positionId, playerId, lineupId) {
	$.ajax({
		url: "" + lineupId + "/lineup_positions/" + positionId,
		type: "PATCH",
		data: { position_id: positionId, position: {
			player_id: playerId }
		},
		success: function(response) {
			$('#available-players').find("#" + response.player_id).remove();
			$('.lineup-position').find("#" + positionId).text(response.player_info);
		}
	});
}

var removeAssignment = function(positionId, lineupId, playerId) {
	$.ajax({
		url: "" + lineupId + "/lineup_positions/" + positionId,
		type: "PATCH",
		data: { position_id: positionId, position: {
			player_id: null }},
		success: function(response) {
			$('.lineup-position').find('#' + positionId).text('');
			addPlayerDiv(lineupId, playerId);
						
		}
	})
}

var addPlayerDiv = function(lineupId, playerId) {
	$.ajax({
		url: "/users/" + playerId + ".json",
		type: "GET",
		success: function(response) {
			$('#available-players').append("<div class='draggable ui-widget-content available-player " +
			"ui-draggable' id='" + response.id + "'>" + response.first_name + " " + response.last_name +
			", " + response.gender + "</div>");
			
			$(function() {
					$( ".draggable" ).draggable({containment: '.lineup-maker', revert: 'invalid',
						cursor: 'move'});
					$( ".droppable" ).droppable({
						drop: function( event, ui ) {
					 	$( this ).addClass( "assigned");
						var playerId = ui.draggable[0].id;
						var positionId = event.target.id;
						assignPosition(positionId, playerId, lineupId);
					  },
					});	
			});
		}
	})
}

var unassign = function(positionId, lineupId) {
	$.ajax({
		url: "" + lineupId + "/lineup_positions/" + positionId,
		type: "GET",
		success: function(response) {
			var playerId = response.player_id;
			removeAssignment(positionId, lineupId, playerId);
		}
});
}