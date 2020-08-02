class AddCartItemToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :cart_item, null: false, foreign_key: true
  end
end
