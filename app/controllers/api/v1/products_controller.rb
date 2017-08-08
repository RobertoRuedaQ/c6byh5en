class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.all
  
  render json: @products, status: :ok
  end
  

  def create
  	@product = Product.new(params[product_params])
  	render json: @product, status: :created
  end


  private

  def product_params
  	params.require(:product).permit(:name, :price)
  end
end