class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id],
    )

    if carted_product.save
      render json: carted_product.as_json
    else
      render json: { errors: carted_product.errors.full_messages }, status: 422
    end
  end
end
