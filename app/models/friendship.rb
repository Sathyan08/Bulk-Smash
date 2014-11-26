class Friendship < ActiveRecord::Base

  scope :confirmed, -> { where(accepted: true) }
  scope :unconfirmed, -> { where(accepted: false) }

  belongs_to :user
  belongs_to :friendee, class_name: "User"

  def find_friend_of(target_user)
    (user == target_user)? friendee : user
  end
end
