class AddColumnsToBlend < ActiveRecord::Migration[6.0]
  def change
    add_column :blends, :shipping_cost, :decimal, precision: 10, scale: 2, default: 0.00
    add_column :blends, :discount_amount, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
