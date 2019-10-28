class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :colour
  belongs_to :make
  belongs_to :size
  belongs_to :condition
  enum sex: { female: 0, male: 1 }
  enum sold: { complete: 0, sold: 1, active: 2 }
end
