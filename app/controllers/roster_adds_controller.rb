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
    # @roster_add = RosterAdd.find_by_player_id(params[:id])
    # team = @roster_add.team
    # @roster_add.destroy
    # redirect_to team_url(team)
    @roster_add = RosterAdd.find(params[:id])
    @roster_add.destroy
    
    respond_to do |format|
      format.html { head :no_content }
      format.json { head :no_content }
    end
  end
  
  private
  
  def roster_params
    params.require(:roster).permit(:player_email, :team_id)
  end
end
