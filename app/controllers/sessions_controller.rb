class SessionsController < ApplicationController
  # GET
  def new; end

  # POST
  def create
    render 'new'
   end

  # Destroy
  def logout; end
end
