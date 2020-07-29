class Property < ApplicationRecord

  has_and_belongs_to_many :blends

  validates_presence_of :name, :descrip

end
