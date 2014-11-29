class Food < ActiveRecord::Base

  belongs_to :unit

  validates :name, presence: true
  validates_uniqueness_of :name

end
