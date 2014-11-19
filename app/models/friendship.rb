class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friendee, class_name: "User"

end
