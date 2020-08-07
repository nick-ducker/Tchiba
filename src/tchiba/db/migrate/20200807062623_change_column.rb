class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column_null :orders, :cart_item_id, true
  end
end
