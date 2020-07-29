class CreateJoinTableBlendsOrders < ActiveRecord::Migration[6.0]
  def change
    create_join_table :blends, :orders do |t|
      # t.index [:blend_id, :order_id]
      # t.index [:order_id, :blend_id]
    end
  end
end
