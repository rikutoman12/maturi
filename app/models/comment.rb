class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  validates :comm, presence: true

end
