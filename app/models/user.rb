class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :menus, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes , dependent: :destroy

    #フォローフォロワー機能
    has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :followings, through: :relationships, source: :followed
    has_many :followers, through: :reverse_of_relationships, source: :follower

    #写真投稿機能
    attachment :profile_image

    validates :name, presence: true,length: {maximum: 10}
    validates :introduction,length: {maximum: 100}

    #フォローフォロワー機能
    def follow(user_id)
      relationships.create(followed_id: user_id)
    end

    def unfollow(user_id)
      relationships.find_by(followed_id: user_id).destroy
    end

    def following?(user)
      followings.include?(user)
    end

end
