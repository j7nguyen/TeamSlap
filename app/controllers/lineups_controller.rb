class LineupsController < ApplicationController
  
  def new
  end
  
  def edit
  end
  
  def create
    @lineup = Lineup.create!(lineup_params)
    if @lineup.save
      render json: @lineup
    else
      flash.now[:errors] = @lineup.errors.full_messages
      redirect_to Game.find(lineup_params[:game_id])
    end
  end
  
  def show
    @lineup = Lineup.find(params[:id])
  end
  
  def destroy
  end
  
  private
  
  def lineup_params
    params.require(:lineup).permit(:team_id, :game_id)
  end
  
end
