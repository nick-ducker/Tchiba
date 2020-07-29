class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.references :buyer, index: true, foreign_key: {to_table: :users}
      t.references :seller, index: true, foreign_key: {to_table: :users}

      t.boolean :shipped, default: false
      t.decimal :gross, precision: 20, scale: 2
      t.decimal :discount, precision: 10, scale: 2, default: 0
      t.decimal :total, precision: 20, scale: 2
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
