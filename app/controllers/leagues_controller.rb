class LeaguesController < ApplicationController
  
  def new
    @league = League.new
    @sports = Sport.all
  end
  
  def create
    @league = League.new(league_params)
    
    if @league.save
      redirect_to league_url(@league)
    else
      flash.now[:errors] = @league.errors.full_messages
      render :new
    end
  end
  
  def show
    @league = League.find(params[:id])
  end
  
  def index
    @leagues = League.all
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def league_params
    params.require(:league).permit(:sport_id, :league_manager_id, :name)
  end
end
