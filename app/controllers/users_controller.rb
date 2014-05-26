class UsersController < ApplicationController
  
  before_filter :require_user!, :except => [:new, :create]
  
  def create
    @user = User.new(user_params)
    @user.session_token = User.generate_session_token
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user_avails = @user.availabilities

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user }
      # format.json { render json: @user, 
      #   :include => { :availabilities => {
      #               :include => :avail_string,
      #               :except => [:created_at, :updated_at]
      #   }, 
      #   :except => [:created_at, :updated_at]
      #   }
      # }
      
      
      # format.json { render json: @user, include: [ 
      #   :availabilities, 
      #   methods: [:avail_string],
      #   except: [:created_at, :updated_at] 
      # ], 
      #   except: [:password_digest, :session_token, :created_at, :updated_at] 
      # }
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :gender)
  end
  
end
