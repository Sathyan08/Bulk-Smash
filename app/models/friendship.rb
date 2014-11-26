class Friendship < ActiveRecord::Base

  scope :confirmed, -> { where(accepted: true) }
  scope :unconfirmed, -> { where(accepted: false) }

  belongs_to :user
  belongs_to :friendee, class_name: "User"
end
