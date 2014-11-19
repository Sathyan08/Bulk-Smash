class User < ActiveRecord::Base

  has_many :friendships_requested, class_name: "Friendship", foreign_key: :user_id
  has_many :friendees, through: :friendships_requested, source: :friendee

  has_many :friendships_received, class_name: "Friendship", foreign_key: :friendee_id
  has_many :frienders, through: :friendships_received, source: :user


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def friends

    friends_array = []

    friendships_received.each do |friendship_received|
      if friendship_received.accepted
        friends << friendship_received.user
      end
    end

    friendships_requested.each do |friendships_requested|
      if friendship_requested.accepted
        friends << friendship_received.friendee
      end
    end

    friends_array
  end

end
