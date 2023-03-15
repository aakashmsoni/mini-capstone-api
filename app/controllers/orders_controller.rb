class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders.as_json
  end

  def show
    order = Order.where(id: params[:id])
    render json: order.as_json
  end

  def create
    product = Product.find_by(id: params[:product_id])
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: (product.price * params[:quantity]),
      tax: (0.09 * (product.price * params[:quantity])),
      total: ((0.09 * (product.price * params[:quantity])) + (product.price * params[:quantity])),
    )
    if order.save
      order.save
      render json: order
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end
end
