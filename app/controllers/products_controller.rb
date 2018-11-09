class ProductsController < ApplicationController
  before_action  :set_product, only: %i[show edit update destroy]
  before_action  :user_is_admin, only: %i[create edit update destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all.paginate(page: params[:page], per_page: 5)
    # @current_user = current_user
    redirect_to root_url
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        product_save_success_response(format,
                                      'Product was successfully created.')
      else
        product_save_failure_response(format, :new)
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        product_save_success_response(format,
                                      'Product was successfully updated.')
      else
        product_save_failure_response(format, :edit)
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
      flash[:info] = 'Product was successfully destroyed.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_save_success_response(format, message)
    format.html { redirect_to @product }
    format.json { render :show, status: :created, location: @product }
    flash[:info] = message
  end

  def product_save_failure_response(format, action)
    format.html { render action }
    format.json do
      render json: @product.errors,
             status: :unprocessable_entity
    end
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :picture, :price)
  end
end
