class Bulk < ActiveRecord::Base

  belongs_to :food

  validates :amount, presence: true
  validates :price, presence: true

end
