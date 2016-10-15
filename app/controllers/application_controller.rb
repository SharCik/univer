class ApplicationController < ActionController::Base

  helper_method :signed_in?, :current_user, :count_rate_answer, :create_tag

  private


  def login(user)
    session[:user_id] = user.id
  end

  def authenticate
    redirect_to signin_path if !signed_in?
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    if session[:user_id]
      @current_user ||= Student.find(session[:user_id])
    end
  end

  def logout
    session[:user_id] = nil
  end

end
