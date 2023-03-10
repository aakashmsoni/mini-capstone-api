class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 0..500 }, presence: true

  belongs_to :supplier
  # product belongs_to :supplier, therefore supplier_id on products table
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # product has_many :images, therefore product_id on images table
  # def images
  #   Image.where(product_id: id)
  # end
end
