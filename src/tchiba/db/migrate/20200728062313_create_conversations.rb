class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|

      t.references :to_user, index: true, foreign_key: {to_table: :users}
      t.references :from_user, index: true, foreign_key: {to_table: :users}
      t.references :blend
      t.boolean :is_active, default: true
      
      t.timestamps
    end
  end
end
