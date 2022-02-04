class Product < ApplicationRecord
  has_one_attached :image

  validates :code, uniqueness: true, presence: true
  validates :name, :quantity, :brand, :manufactured_at, :price, :cost_price, presence: true
  
end
