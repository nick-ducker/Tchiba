class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :blend, null: false, foreign_key: true
      t.integer :blend_quantity, default: 1

      t.timestamps
    end
  end
end
