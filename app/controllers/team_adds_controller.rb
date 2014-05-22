class TeamAddsController < ApplicationController
  def create
    @team_add = TeamAdd.new(team_add_params)
    league = League.find(team_add_params[:league_id])
    if @team_add.save
      redirect_to league_url(league)
    else
      flash[:errors] = ["Sorry, we are unable to add that team."]
      retired_to league_url(league)
    end
  end
  
  def destroy
    @team_add = TeamAdd.find(params[:id])
    league = @team_add.league
    @team_add.destroy
    redirect_to league_url(league)
  end
  
  private
  
  def team_add_params
    params.require(:team_add).permit(:team_id, :league_id)
  end
end
