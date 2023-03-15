class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render template: "orders/index"
  end

  def show
    order_id = params[:id]
    # @order = Order.where(user_id: current_user.id).find_by(id: order_id)
    @order = current_user.orders.find_by(id: order_id)
    if @order
      render template: "orders/show"
    else
      render json: { errors: "Order does not exist" }, status: :bad_request
    end
  end

  def create
    product = Product.find_by(id: params[:product_id])
    subtotal = product.price * params[:quantity]
    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    if @order.save
      render json: @order.as_json
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end
end
