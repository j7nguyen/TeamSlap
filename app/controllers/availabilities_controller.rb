class AvailabilitiesController < ApplicationController
    
  def create
    @avail = Availability.create!(avail_params)
    respond_to do |format|
      format.html { redirect_to game_url(Game.find(avail_params[:game_id])) }
      format.json { render :json => @avail }
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def index
  end
  
  def show
  end

  private
  
  def avail_params
    params.require(:avail).permit(:player_id, :game_id, :available_value)
  end
  
end
