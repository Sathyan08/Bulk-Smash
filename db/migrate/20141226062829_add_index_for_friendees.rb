class AddIndexForFriendees < ActiveRecord::Migration
  def change
    add_index :friendships, :friendee_id
  end
end
