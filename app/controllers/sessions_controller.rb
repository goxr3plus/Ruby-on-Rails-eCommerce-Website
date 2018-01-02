class SessionsController < ApplicationController
  # GET
  def new
     # byebug
   end

  # POST
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
   end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  # Destroy
  def logout; end
end
