class ListItem < ActiveRecord::Base

  belongs_to :list
  belongs_to :user

  validates :list_id, presence: true
  validates :food_id, presence: true

end
