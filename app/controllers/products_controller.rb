class ProductsController < ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def index
    # products = Product.all
    # render json: products.as_json
    @products = Product.all
    render template: "products/index"
  end

  def products_under_20
    products = Product.where("price < '20'")
    render json: products.as_json
  end

  def show
    product_id = params[:id]
    # product = Product.find_by(id: product_id)
    # render json: product.as_json
    @product = Product.find_by(id: product_id)
    render template: "products/show"
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    product.save
    render json: product.as_json
  end

  def update
    product_id = params[:id]
    product = Product.find(product_id)
    product.update(
      name: params[:name] || product.name,
      price: params[:price] || product.price,
      image_url: params[:image_url] || product.image_url,
      description: params[:description] || product.description,
    )
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Successfully deleted!" }
  end
end
