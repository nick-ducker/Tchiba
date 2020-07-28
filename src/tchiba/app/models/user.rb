class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :address
  has_many :conversations
  has_many :blends
  has_many :reviews
  has_many :orders

  validates_presence_of :credit

  
end
