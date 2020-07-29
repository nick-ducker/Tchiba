class Review < ApplicationRecord

  validates_presence_of :rating, :descrip
  validates :rating, numericality: true, numericality: {less_than_or_equal_to: 5.00}

  belongs_to :user
  belongs_to :blend
end
