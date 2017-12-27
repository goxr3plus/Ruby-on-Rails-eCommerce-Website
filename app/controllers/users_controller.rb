class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # byebug
  end

  def new
    @user = User.new
   end
end
