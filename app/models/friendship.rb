class Friendship < ActiveRecord::Base

  scope :confirmed, -> { where(accepted: true) }

  belongs_to :user
  belongs_to :friendee, class_name: "User"
end
