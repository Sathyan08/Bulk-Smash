class AddAmounttoListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :amount, :integer, null: false
  end
end
