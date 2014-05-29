class LineupPositionsController < ApplicationController
  def new
  end
  
  def show
    @position = LineupPosition.find(params[:id])
    respond_to do |format|
      format.json { render json: @position, methods: :player_info,
            except: [:created_at, :updated_at] }
          end
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
    if params[:position_id]
      @position = LineupPosition.find(params[:position_id])
    else
      @position = LineupPosition.find(params[:id])
    end
    
    if @position.update_attributes(position_params)
      if @position.player_id.nil?
        render json: @position, except: [:created_at, :updated_at]
      else
        render json: @position, methods: :player_info,
            except: [:created_at, :updated_at]
      end
    else
      flash.now[:errors] = @position.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def position_params
    params.require(:position).permit(:name, :lineup_id, :player_id)
  end
  
end