class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 6)
      @current_user = current_user
    end
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order('created_at ASC').paginate(page: params[:page], per_page: 5)
    else
      @products = @products.order('created_at ASC').paginate(page: params[:page], per_page: 5)
    end
  end

  def products; end

  def about; end

  def contact; end
end
