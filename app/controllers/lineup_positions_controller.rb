class LineupPositionsController < ApplicationController
  def new
  end
  
  def show
  end
  
  def create
    @position = LineupPosition.new(position_params)
    if @position.save
      render json: @position
    else
      flash[:errors] = @position.errors.full_messages
      lineup = position_params[:lineup_id]
      redirect_to team_lineup_url(lineup.team, lineup)
    end
  end
  
  def destroy
  end
  
  def update
  end
  
  private
  
  def position_params
    params.require(:position).permit(:name, :lineup_id, :player_id)
  end
end
