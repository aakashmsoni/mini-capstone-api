class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )

    if carted_product.save
      render json: { message: "Added to cart!" }, status: :created
    else
      render json: { errors: carted_product.errors.full_messages }, status: 422
    end
  end
end
