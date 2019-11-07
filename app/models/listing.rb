class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :colour
  belongs_to :make
  belongs_to :size
  belongs_to :condition
  enum sex: { girls: 0, boys: 1, unisex: 2 }
  enum sold: { sold: 1, active: 2 }

  validates :price, numericality: true
  validates :deposit,numericality: true 
  validates_numericality_of :deposit, :less_than_or_equal_to => :price

  validates :title, presence: true, length: { minimum: 10 }

  validates :description, presence: true, length: { minimum: 30 }

  has_one_attached :picture
end
