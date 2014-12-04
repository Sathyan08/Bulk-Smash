class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :list_id, null: false
      t.integer :food_id, null: false

      t.timestamps
    end
  end
end
