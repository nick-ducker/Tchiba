class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :blend
  #HAS ONE ORDER???

  validates :blend_quantity, numericality: { greater_than_or_equal_to: 1}
end
