class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:show, :index]

  def index
    # products = Product.all
    # render json: products.as_json
    @products = Product.all
    render template: "products/index" # <--- uses jsonbuilder gem to display
    # render json: @products, :include => [:supplier, :images, :]
  end

  # def products_under_20
  #   products = Product.where("price < '20'")
  #   render json: products.as_json
  # end

  def show
    product_id = params[:id]
    # product = Product.find_by(id: product_id)
    # render json: product.as_json
    @product = Product.find_by(id: product_id)
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
      inventory: params[:inventory],
      # images: params[:images] <---- breaks code
    )
    if @product.save
      image = Image.new(product_id: @product.id, url: params[:url])
      image.save
      # happy path
      render template: "products/show"
    else
      # sad path
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      description: params[:description] || @product.description,
      inventory: params[:inventory] || @product.inventory,
      supplier_id: params[:supplier_id] || @product.supplier_id,
      # images: params[:images] || @product.images,
    )

    if @product.save
      # happy path
      render template: "products/show"
    else
      # sad path
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Successfully deleted!" }
  end
end
