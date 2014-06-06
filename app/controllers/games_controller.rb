class GamesController < ApplicationController
  
  def new
    @league = League.find(params[:league_id])
    if signed_in? && @league.league_manager_id == current_user.id
      render :new
    else
      flash[:errors] = ["Only league managers can create new games."]
      redirect_to league_url(@league)
    end
    
  end
  
  def create
    @game = Game.new(game_params)
    @league = League.find(params[:league_id])
    if @game.save
      if @game.team2_name
        redirect_to team_url(Team.find(@game.team1_id))
      else
        redirect_to league_url(League.find(params[:league_id]))
      end
    else
      flash.now[:errors] = @game.errors.full_messages
      render :new
    end
  end
  
  def destroy
  end
  
  def edit
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      render json: @game
    else
      flash[:errors] = @game.errors.full_messages
      redirect_to league_url(@game.league)
    end
  end
  
  def index
  end
  
  def show
    @game = Game.find(params[:id])
    @my_teams = current_user.teams + current_user.owned_teams
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @game }
    end 
  end
  
  private
  
  def game_params
    params.require(:game).permit(:league_id, :team1_id, :team2_id, :location_id,
     :date, :time, :team2_name, :team1_score, :team2_score)
  end
end
