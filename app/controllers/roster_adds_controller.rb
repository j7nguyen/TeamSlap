class RosterAddsController < ApplicationController
  
  def create
    player_id, team_id = roster_params['player_id'], roster_params['team_id']
    player = User.find(player_id)
    team = Team.find(team_id)
    if player
      @roster_add = RosterAdd.create({player_id: player.id, team_id: team_id})
      render :json => @roster_add
    else
      flash[:errors] = ["Something went wrong, sorry."]
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
    

        render :json => @roster_add

  end
  
  private
  
  def roster_params
    params.require(:roster).permit(:player_id, :team_id)
  end
end
