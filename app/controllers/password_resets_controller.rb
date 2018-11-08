# Cases
# 1.An expired password reset
# 2.A failed update due to an invalid password
# 3.A failed update (which initially looks “successful”) due to an empty password and confirmation
# 4.A successful update

class PasswordResetsController < ApplicationController
  before_action :get_user,         only: %i[edit update]
  before_action :valid_user,       only: %i[edit update]
  before_action :check_expiration, only: %i[edit update] # Case (1)

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      # flash[:info] = 'Email sent with password reset instructions'
      flash[:info] = "Visit this link to reset your account ~-> #{edit_password_reset_url(@user.reset_token, email: @user.email)}".html_safe
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new'
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)          # Case (4)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit'                                     # Case (2)
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Before filters

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid user.
  def valid_user
    unless @user && @user.activated? &&
           @user.authenticated?(:reset, params[:id])
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = 'Password reset has expired.'
      redirect_to new_password_reset_url
    end
  end
end
