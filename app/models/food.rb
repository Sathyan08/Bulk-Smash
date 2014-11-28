class Food < ActiveRecord::Base

  belongs_to :unit

  validates :name, presence: true

end
