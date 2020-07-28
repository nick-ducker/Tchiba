class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.references :user, foreign_key: true
      t.integer :number
      t.string :street
      t.string :suburb
      t.string :state
      t.integer :postcode

      t.timestamps
    end
  end
end
