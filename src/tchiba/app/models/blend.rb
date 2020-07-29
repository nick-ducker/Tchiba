class Blend < ApplicationRecord
  belongs_to :user

  has_many :conversations
  
  
  has_and_belongs_to_many :orders

  has_many :blends_properties
  has_and_belongs_to_many :properties

  has_many :reviews
  
  validates_presence_of :name, :price, :quantity, :descrip, :weight
  validates_numericality_of :price, :weight

end
