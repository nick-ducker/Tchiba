class Blend < ApplicationRecord
  belongs_to :user

  has_many :conversations

  has_many :cart_items
  
  has_and_belongs_to_many :properties

  has_many :reviews

  has_many_attached :images
  
  validates_presence_of :name, :price, :quantity, :descrip, :weight
  validates_numericality_of :price, :weight

end
