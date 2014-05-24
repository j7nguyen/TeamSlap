class AvailabilitiesController < ApplicationController
    
  def create
    @avail = Availability.new(avail_params)
    if @avail.save
      redirect_to user_url(@avail.player)
    else
      flash[:errors] = @avail.errors.full_messages
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
