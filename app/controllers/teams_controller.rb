class TeamsController < ApplicationController
  before_filter :require_user!, :except => [:new, :create]
  
  def new
    @sports = Sport.all
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      RosterAdd.create({team_id: @team.id, player_id: @team.manager_id})
      redirect_to team_url(@team)
    else
      flash.now[:errors] = @team.errors.full_messages
      render :new
    end
  end
  
  def show
    @team = Team.find(params[:id])
    @roster = @team.roster_adds.map{ |roster_add| User.find(roster_add.player_id) }
    @non_roster_players = User.all.select{ |player| !@roster.include?(player) }
  end
  
  def index
    @teams = Team.all
  end
  
  private
  
  def team_params
    params.require(:team).permit(:name, :sport_id, :manager_id)
  end
  
end
