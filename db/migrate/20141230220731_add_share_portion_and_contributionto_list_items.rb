class AddSharePortionAndContributiontoListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :share, :float
    add_column :list_items, :portion, :float
    add_column :list_items, :contribution, :float
  end
end
