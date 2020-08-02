class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :shipping, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
