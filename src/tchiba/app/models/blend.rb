class Blend < ApplicationRecord
  belongs_to :user

  has_many :conversations

  has_many :cart_items
  
  has_and_belongs_to_many :properties

  has_many :reviews

  has_many :orders

  has_many_attached :image
  
  validates_presence_of :name, :price, :quantity, :descrip, :weight
  validates_numericality_of :price, :weight

  def aggregate_ratings
    #checks to see if the blend has any reviews
    if self.reviews.empty?
      return 0.0
    else
      #loads all the reviews for the blend and then averages the rating of them all
      reviews = self.reviews.all
      rating = reviews.average(:rating)
      return rating.round(2)
    end
  end

end
