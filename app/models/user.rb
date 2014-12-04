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
end
