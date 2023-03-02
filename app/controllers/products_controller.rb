class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products.as_json
  end

  def products_under_20
    products = Product.where("price < '20'")
    render json: products.as_json
  end

  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end
end
