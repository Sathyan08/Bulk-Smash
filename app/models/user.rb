class User < ActiveRecord::Base

  has_many :friendships_requested, class_name: "Friendship", foreign_key: :user_id
  has_many :friendees, through: :friendships_requested, source: :friendee

  has_many :friendships_received, class_name: "Friendship", foreign_key: :friendee_id
  has_many :frienders, through: :friendships_received, source: :user

  has_many :lists
  has_many :list_items, through: :lists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def accepted_friendships
    friendships_requested.confirmed + friendships_received.confirmed
  end

  def friends
    accepted_friendships.inject([ ]) { |friends_array, friendship| friends_array << friendship.find_friend_of(self) }
  end

  def find_friendship_by_friend_id(id)
    friendships_received.where("user_id = ?", id) + friendships_requested.where("friendee_id = ?", id)
  end

  def items
    lists.current.inject([ ]) { |items_array, list| items_array + list.list_items }
  end

  def item_names
    names = items.inject([ ]) { |names_array, item| names_array << item.food.name }
    names.uniq
  end

  def friend_items
    friends.inject([ ]) { |items_array, friend| items_array + friend.items  }
  end

  def total_items
    items + friend_items
  end

  def find_all_items_with(name)
    total_items.find_all { |item| item.food.name == name }
  end

  def total_items_by_name
    item_names.inject([ ]) { |matches, name| matches << find_all_items_with(name) }
  end
end
