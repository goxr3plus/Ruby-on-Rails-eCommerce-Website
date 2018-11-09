class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if valid_for_activation?(user)
      activate_account(user)
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end

  private

  def valid_for_activation?(user)
    user && !user.activated? && user.authenticated?(:activation, params[:id])
  end

  def activate_account(user)
    user.activate
    log_in user
  end
end
