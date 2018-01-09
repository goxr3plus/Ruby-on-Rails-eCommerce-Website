class OrdersController < ApplicationController
  before_action :logged_in_user, only: %i[index show new create]

  def index
    @orders = Order.all
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
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to orders_path
end

  private

  def order_params
    params.require(:order).permit(:user_id, :pay_method, :description)
  end
end
