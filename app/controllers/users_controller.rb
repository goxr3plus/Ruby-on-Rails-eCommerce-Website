class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # byebug
  end

  def new
    @user = User.new
   end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      # Handle a successful save.
      flash[:success] = "#{:success}"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
