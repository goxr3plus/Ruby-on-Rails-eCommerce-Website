class CartsController < ApplicationController
  before_action :logged_in_user, only: %i[show destroy]

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
