class List < ActiveRecord::Base

  scope :current, -> { where(current: true) }

  belongs_to :user
  has_many :list_items

  validates :user_id, presence: true
  validates :name, presence: true
end
