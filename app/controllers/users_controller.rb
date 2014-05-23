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
