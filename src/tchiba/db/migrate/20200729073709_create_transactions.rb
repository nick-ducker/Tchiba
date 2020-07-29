class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :amount, precision: 20, scale: 2
      t.boolean :paid, default: false
      t.boolean :is_refund , default: false

      t.timestamps
    end
  end
end
