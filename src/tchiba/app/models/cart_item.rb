class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :blend
  has_one :order 
  #HAS ONE ORDER???

  validates :blend_quantity, numericality: { greater_than_or_equal_to: 1}

  def gross_price
    return self.blend.price * self.blend_quantity
  end

  def total_discount
    return self.blend.discount_amount * self.blend_quantity
  end

  def total_amount
    gross = gross_price - total_discount + self.blend.shipping_cost
  end
end
