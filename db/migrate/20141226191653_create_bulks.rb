class CreateBulks < ActiveRecord::Migration
  def change
    create_table :bulks do |t|
      t.integer :food_id
      t.float :amount
      t.float :price

      t.timestamps
    end
  end
end
