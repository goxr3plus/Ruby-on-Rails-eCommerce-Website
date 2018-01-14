class OrdersController < ApplicationController
  before_action :logged_in_user, only: %i[index show new create]

  def index
    @orders = Order.all
    if params[:search]
      @orders = Order.search(params[:search]).order('created_at ASC').paginate(page: params[:page], per_page: 5)
    else
      @orders = @orders.order('created_at ASC').paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @cart = @current_cart
  end

  def create
    @order = Order.new(order_params)
    @order.update(user_id: @current_user.id)
    @current_cart.line_items.each do |item|
      item.cart_id = nil
      item.order_id = @order.id
      item.save
      @order.line_items << item
    end
    @order.save!
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to orders_path
    # byebug
end

  private

  def order_params
    params.require(:order).permit(:user_id, :pay_method, :description)
  end
end
