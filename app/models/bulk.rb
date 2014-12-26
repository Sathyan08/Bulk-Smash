class Bulk < ActiveRecord::Base

  belongs_to :food

  validates :amount, numericality: { greater_than: 0 }, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true

end
