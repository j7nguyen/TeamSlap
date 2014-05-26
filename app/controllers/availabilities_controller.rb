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
    @avail = Availability.find(params[:id])
    if @avail.update_attributes(avail_params)
      render json: @avail, methods: :avail_string,
            except: [:created_at, :updated_at]
    else
      flash.now[:errors] = @avail.errors.full_messages
      render :edit
    end
  end
  
  def destroy
  end
  
  def index
  end
  
  def show
    @avail = Availability.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @avail, methods: :avail_string,
      except: [:created_at, :updated_at]  }
    end
  end

  private
  
  def avail_params
    params.require(:avail).permit(:player_id, :game_id, :available_value)
  end
  
end
