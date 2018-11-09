class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update
                                          destroy following followers]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy

  def index
    @users = if params[:search]
               User.search(params[:search]).order('created_at ASC')
                   .paginate(page: params[:page], per_page: 5)
             else
               User.where(activated: true).order('created_at ASC')
                   .paginate(page: params[:page], per_page: 5)
             end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 4)
    fetch_additional_fields
    redirect_to(root_url) && return unless @user.activated?
  end

  def new
    @user = User.new
    # byebug
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      notify_user
      flash[:info] = generate_activation_message.html_safe
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
    redirect_back(fallback_location: users_url)
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 10)
    @users2 = @user.following
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    @users2 = @user.followers
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end

  def notify_user
    # Handle a successful save. massalel
    @user.send_activation_email
    UserMailer.account_activation(@user).deliver_now
    # "Order created - Click <a href='https://www.google.com'>here</a>
    # to pay for it!".html_safe
  end

  # Before filters

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

  def fetch_additional_fields
    @micropost  = current_user.microposts.build
    @feed_items = @user.feed.paginate(page: params[:page], per_page: 6)
  end

  def generate_activation_message
    'Visit this link to activate your account ~-> ' +
      edit_account_activation_url(@user.activation_token,
                                  email: @user.email).to_s
  end
end
