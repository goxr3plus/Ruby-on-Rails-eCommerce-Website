class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 6)
      @current_user = current_user
    end
    fetch_products
  end

  def products; end

  def about; end

  def contact; end

  private

  def fetch_products
    @products = if params[:search]
                  Product.search(params[:search])
                         .order('created_at ASC')
                         .paginate(page: params[:page], per_page: 5)
                else
                  Product.order('created_at ASC')
                         .paginate(page: params[:page], per_page: 5)
                end
  end
end
