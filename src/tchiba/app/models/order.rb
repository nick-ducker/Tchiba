class Order < ApplicationRecord

  belongs_to :cart

  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id

  has_many :transactions

  validates_presence_of :gross, :total
  validates_numericality_of :gross, :total

end
