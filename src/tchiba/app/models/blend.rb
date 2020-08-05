class Blend < ApplicationRecord
  belongs_to :user

  has_many :conversations

  has_many :cart_items
  
  has_and_belongs_to_many :properties

  has_many :reviews

  has_many_attached :image
  
  validates_presence_of :name, :price, :quantity, :descrip, :weight
  validates_numericality_of :price, :weight

  def aggregate_ratings
    reviews = self.reviews.all
    rating = reviews.average(:rating)
    return rating.round(2)
  end

end
