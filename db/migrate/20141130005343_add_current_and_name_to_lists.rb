class AddCurrentAndNameToLists < ActiveRecord::Migration
  def change

    add_column :lists, :current, :boolean, default: true
    add_column :lists, :name, :string, null: false

  end
end
