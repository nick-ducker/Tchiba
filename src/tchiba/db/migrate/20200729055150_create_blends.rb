class CreateBlends < ActiveRecord::Migration[6.0]
  def change
    create_table :blends do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :totalrating, precision: 3, scale: 2, default: 0.00
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity
      t.text :descrip
      t.integer :weight

      t.timestamps
    end
  end
end
