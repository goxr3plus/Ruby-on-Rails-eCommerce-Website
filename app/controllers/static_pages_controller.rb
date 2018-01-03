class StaticPagesController < ApplicationController
  def home
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def help; end

  def about; end

  def contact; end
end
