class Colour < ApplicationRecord
  has_many :listings

  validates :colour, presence: true
end
