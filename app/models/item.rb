class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :cart_items, dependent: :destroy
  
  
  validates :title, presence: true 
  validates :image_url, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  
end
