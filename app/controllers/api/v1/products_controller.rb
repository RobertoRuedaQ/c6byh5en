class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.all

  render json: @products, status: :ok
  end


  def create
  	@product = Product.new(product_params)
  	if @product.save
  	render json: @product, status: :created
    else
    render json: @product.errors.messages, status: 422
    end
  end

  def update
      @product = Product.find(params[:id])
      @product.update(products_params)
      if @product.valid?
        render json: @product, status: :ok
      else
      render json: @product.errors.messages, status: 422
      end
    end

    def destroy
      @product = Product.find(params[:id])
      if @product.destroy
      status: 204
      end
    end

  private

  def product_params
  	params.require(:product).permit(:name, :price)
  end
end
