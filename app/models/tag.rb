class Tag < ApplicationRecord
  has_many :menus,dependent: :destroy
end
