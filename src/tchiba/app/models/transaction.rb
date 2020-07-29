class Transaction < ApplicationRecord
  belongs_to :order

  validates :amount, presence: true, numericality: true
end
