class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :address
  has_one :cart
  has_one_attached :profilepic
  has_many :to_conversations, foreign_key: "to_user_id", class_name: "Conversation"
  has_many :from_conversations, foreign_key: "from_user_id", class_name: "Conversation"
  has_many :blends
  has_many :reviews
  has_many :buyer_orders, foreign_key: "buyer_id", class_name: "Order"
  has_many :seller_orders, foreign_key: "seller_id", class_name: "Order"

  validates_presence_of :credit, :name

  def calculate_credit
    credit = 0.0
    #checks to see if the user has any seller orders
    if self.seller_orders
      #iterates through each of the seller orders
      self.seller_orders.each do |order|
        if order.paid
          #iterates through each of the transactions and adds them to a var if they have been paid
          order.transactions.each do |trans|
            if trans.paid
              credit += trans.amount  
            end
          end
        end
      end 
    end
    return credit.round(2) 
  end

end
