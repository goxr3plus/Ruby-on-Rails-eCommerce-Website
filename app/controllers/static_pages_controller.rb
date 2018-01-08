class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 6)
      @current_user = current_user
    end
    @products = Product.all.paginate(page: params[:page], per_page: 5)
   end

  def products; end

  def about; end

  def contact; end
end
