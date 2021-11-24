class Spot < ApplicationRecord
  belongs_to :menu

  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true

end
