class Make < ApplicationRecord
  has_many :listings
  validates :make, presence: true
end
