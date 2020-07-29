class Order < ApplicationRecord

  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id

  has_and_belongs_to_many :blends

  has_many :transactions

  validates_presence_of :gross, :total
  validates_numericality_of :gross, :total

end
