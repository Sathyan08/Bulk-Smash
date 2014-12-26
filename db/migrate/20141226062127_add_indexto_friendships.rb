class AddIndextoFriendships < ActiveRecord::Migration
  def change
    add_index :friendships, [:user_id, :friendee_id], unique: true
  end
end
