class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blend, null: false, foreign_key: true
      t.decimal :rating, precision: 3, scale: 2
      t.text :descrip

      t.timestamps
    end
  end
end
