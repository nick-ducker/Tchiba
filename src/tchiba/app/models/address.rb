class Address < ApplicationRecord

  belongs_to :user

  validates_presence_of :number, :street, :suburb, :state, :postcode
  validates_numericality_of :number, :postcode

end
