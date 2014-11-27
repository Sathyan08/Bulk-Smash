class Food < ActiveRecord::Base

  validates :name, presence: true

end
