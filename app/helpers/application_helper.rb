module ApplicationHelper
  def auth_token_input
    "<input type='hidden'
    name='authenticity_token'
    value='#{form_authenticity_token}'>".html_safe
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?(user)
    signed_in? && user == current_user
  end

  def signed_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
  end
  
  def require_user!
    redirect_to new_session_url unless signed_in?
  end
end
