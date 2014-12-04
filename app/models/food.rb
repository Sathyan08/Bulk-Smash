class Food < ActiveRecord::Base

  belongs_to :unit
  has_many :list_items

  validates :name, presence: true
  validates_uniqueness_of :name

end
