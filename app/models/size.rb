class Size < ApplicationRecord
  has_many :listings
  validates :size, presence: true
end
