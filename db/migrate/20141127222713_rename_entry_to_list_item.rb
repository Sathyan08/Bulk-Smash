class RenameEntryToListItem < ActiveRecord::Migration
  def up
    rename_table :entries, :list_items
  end

  def down
    rename_table :list_items, :entries
  end
end
