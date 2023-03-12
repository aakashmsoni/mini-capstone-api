class ImagesController < ApplicationController
  def index
    image = Image.all
    render json: image.as_json
  end

  def show
    image_id = params[:id]
    # product = Product.find_by(id: product_id)
    # render json: product.as_json
    image = Image.find_by(id: image_id)
    render json: image.as_json
  end

  def create
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
    )
    if @image.save
      render json: @image.as_json
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
