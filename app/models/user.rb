class User < ActiveRecord::Base

  # has_many :reviews_written, class_name: "Review", foreign_key: :user_id
  # has_many :reviewees, through: :reviews_written, source: :reviewee

  # has_many :reviews_received, class_name: "Review", foreign_key: :reviewee_id#, class_name: :review, foreign_key: :reviewee_id
  # has_many :reviewers, through: :reviews_received, source: :user
  has_many :friendships_requested, class_name: "Friendship", foreign_key: :user_id
  has_many :friendees, class_name: "Friend", through: :friendships_requested, source: :friendee

  has_many :friendships_received, class_name: "Friendship", foreign_key: :friendee_id
  has_many :frienders, through: :friendships_received, source: :user


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
