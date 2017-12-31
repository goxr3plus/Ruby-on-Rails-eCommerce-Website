class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
     # byebug
   end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      # Handle a successful save. massalel
      log_in @user
      flash[:success] = "Successfully created user [ #{@user.name} ]"
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
