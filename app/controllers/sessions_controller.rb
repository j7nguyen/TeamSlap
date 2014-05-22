class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])

    if @user.nil?
      flash.now[:errors] = ["That email address was not found. Maybe you should sign up?"]
      render :new
    else
      @user.password= session_params[:password]
      login!(@user)
      redirect_to @user
    end
  end

  def new
    @user = User.new
  end

  def destroy
    if current_user
      logout!
    end
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
