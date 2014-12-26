class Bulk < ActiveRecord::Base

  belongs_to :food

  validates :food_id, numericality: true, presence: true
  validates :amount, numericality: { greater_than: 0 }, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true

end
