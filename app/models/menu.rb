class Menu < ApplicationRecord

      belongs_to :user

      attachment :image

      has_many :comments, dependent: :destroy
      has_many :likes, dependent: :destroy
      has_one :spot, dependent: :destroy

      accepts_nested_attributes_for :spot

      validates :title, presence: true
      validates :body, presence: true
      validates :image, presence: true

   def liked_by?(user)
     likes.where(user_id: user.id).exists?
   end

end
