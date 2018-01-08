class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def user_is_admin
    unless current_user.admin?
      flash[:info] = "You don't have the privilages for this action"
      redirect_back(fallback_location: root_url)
    end
  end
end
