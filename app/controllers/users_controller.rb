class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
end

  def show
    @user = User.find(params[:id])
    redirect_to(root_url) && return unless @user.activated?
  end

  def new
    @user = User.new
    # byebug
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      # Handle a successful save. massalel
      @user.send_activation_email
      UserMailer.account_activation(@user).deliver_now
      # "Order created - Click <a href='https://www.google.com'>here</a> to pay for it!".html_safe
      flash[:info] = "Visit this link to activate your account ~-> #{edit_account_activation_url(@user.activation_token, email: @user.email)}".html_safe
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
   end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def create_activation_digest
    # Create the token and digest.
  end
end
