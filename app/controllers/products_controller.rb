class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products.as_json
  end

  def products_under_20
    products = Product.where("price < '20'")
    render json: products.as_json
  end
end
