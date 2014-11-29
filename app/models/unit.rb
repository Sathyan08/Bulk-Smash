class Unit < ActiveRecord::Base

  has_many :foods

  validates :name, presence: true
  validates_uniqueness_of :name

end
