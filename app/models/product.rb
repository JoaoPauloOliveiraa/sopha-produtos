class Product < ApplicationRecord
  validates :code, uniqueness: true, presence: true
  validates :name, :quantity, :brand, :manufactured_at, :price, :cost_price, presence: true
  def product_params 
    params.permit(:name, :code, :quantity, :brand, :manufactured_at, :due_date, :price, :cost_price)
  end
end
