class RosterAddsController < ApplicationController
  
  def create
    player_email, team_id = roster_params['player_email'], roster_params['team_id']
    player = User.find_by_email(player_email)
    team = Team.find(team_id)
    if player
      @roster_add = RosterAdd.create({player_id: player.id, team_id: team_id})
      redirect_to team_url(team)
    else
      flash[:errors] = ["Could not find player with that email address."]
      redirect_to team_url(team)
    end
  end
  
  def destroy
    @roster_add = RosterAdd.find(params[:id])
    team = @roster_add.team
    @roster_add.destroy
    redirect_to team_url(team)
  end
  
  private
  
  def roster_params
    params.require(:roster).permit(:player_email, :team_id)
  end
end
