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
    if @game.save
      redirect_to league_url(League.find(params[:league_id]))
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
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def game_params
    params.require(:game).permit(:league_id, :team1_id, :team2_id, :location_id, :date, :time)
  end
end
