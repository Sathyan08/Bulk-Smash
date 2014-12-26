class Bulk < ActiveRecord::Base

  belongs_to :food

  validates :amount, numericality: true, presence: true
  validates :price, numericality: true, presence: true

end
