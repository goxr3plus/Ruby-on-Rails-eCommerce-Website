class SessionsController < ApplicationController
  # GET
  def new
    # byebug
  end

  # POST
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if authenticated?(user)
      perform_authenticated_action(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  # Destroy
  def logout; end

  private

  def authenticated?(user)
    user && user.authenticate(params[:session][:password])
  end

  def perform_authenticated_action(user)
    if user.activated?
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      # redirect_back_or user
      redirect_back_or root_url
    else
      message = 'Account not activated. '
      message += 'Check your email for the activation link.'
      flash[:warning] = message
      redirect_to root_url
    end
  end
end
