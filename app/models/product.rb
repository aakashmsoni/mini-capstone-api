class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 0..500 }, presence: true

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
