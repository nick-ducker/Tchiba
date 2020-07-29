class CreateJoinTableBlendsProperties < ActiveRecord::Migration[6.0]
  def change
    create_join_table :blends, :properties do |t|
      # t.index [:blend_id, :property_id]
      # t.index [:property_id, :blend_id]
    end
  end
end
