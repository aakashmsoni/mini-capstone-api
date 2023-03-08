class SuppliersController < ApplicationController
  def index
    supplier = Supplier.all
    render json: supplier.as_json
  end

  def show
    supplier_id = params[:supplier_id]
    # product = Product.find_by(id: product_id)
    # render json: product.as_json
    supplier = Supplier.find_by(id: supplier_id)
    render json: supplier.as_json
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    if supplier.save
      # happy path
      render json: supplier.as_json
    else
      # sad path
      render json: { errors: supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    supplier_id = params[:supplier_id]
    supplier = Supplier.find(supplier_id)
    supplier.update(
      name: params[:name] || supplier.name,
      email: params[:email] || supplier.email,
      phone_number: params[:phone_number] || supplier.phone_number,
    )

    if supplier.save
      # happy path
      render json: supplier.as_json
    else
      # sad path
      render json: { errors: supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find_by(id: params[:supplier_id])
    supplier.destroy
    render json: { message: "Successfully deleted!" }
  end
end
