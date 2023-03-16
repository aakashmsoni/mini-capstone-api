class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 0..500 }, presence: true
  has_many :orders
  has_many :category_products
  has_many :images
  belongs_to :supplier
  # product belongs_to :supplier, therefore supplier_id on products table
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # product has_many :images, therefore product_id on images table
  # def images
  #   Image.where(product_id: id)
  # end

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
