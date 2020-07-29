class Blend < ApplicationRecord
  belongs_to :user

  has_many :conversations
  
  has_many :orders_blends
  has_many :orders, through: :orders_blends

  has_many :blends_properties
  has_many :properties, through: :blends_properties

  has_many :reviews
  
  validates_presence_of :name, :price, :quantity, :descrip, :weight
  validates_numericality_of :price, :weight

end
