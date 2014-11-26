class Friendship < ActiveRecord::Base

  scope :confirmed, -> { where(accepted: true) }
  scope :unconfirmed, -> { where(accepted: false) }

  belongs_to :user
  belongs_to :friendee, class_name: "User"

  def find_friend(target_user)
    if user == target_user
      friend = user
    else
      friend = friendee
    end

    friend
  end
end
