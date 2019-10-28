class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :colour
  belongs_to :make
  belongs_to :size
  belongs_to :condition
  belongs_to :location

  enum sold: { all: 0, sold: 1, active: 2 }
end
