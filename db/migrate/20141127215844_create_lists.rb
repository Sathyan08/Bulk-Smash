class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
