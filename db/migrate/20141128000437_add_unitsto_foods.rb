class AddUnitstoFoods < ActiveRecord::Migration
  def change
    add_column :foods, :unit_id, :integer
  end
end
