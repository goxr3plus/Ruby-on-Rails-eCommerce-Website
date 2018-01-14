class OrdersController < ApplicationController
  before_action :logged_in_user, only: %i[index show new create]
  before_action :user_is_admin, only: %i[destroy edit]

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

  # def destroy
  #   respond_to do |format|
  #     if @order.destroy!
  #      format.html { redirect_to products_url }
  #      format.json { head :no_content }
  #      flash[:info] = 'Order was successfully destroyed.'
  #     else
  #       flash[:info] = 'Error destroying the order'
  #     end
  #   end
  # end

  def destroy
    @order = Order.find(params[:id])
    flash[:info] = 'Found product to destroy'
    # @order.destroy
    # respond_to do |format|
    #   format.html { redirect_to orders_path, notice: 'Order was successfully destroyed.' }
    #   format.json { head :no_content }
    #   flash[:info] = 'Order was successfully destroyed.'
    # end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
     @order = Order.update(order_params)
     redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :pay_method, :description)
  end
end
