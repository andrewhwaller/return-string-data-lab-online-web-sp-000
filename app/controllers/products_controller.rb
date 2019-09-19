class ProductsController < ApplicationController
  before_action :set_product, only: [:inventory, :description]

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    render plain: @product.inventory != 0
  end


  def description
    render plain: @product.description
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description)
  end
end
