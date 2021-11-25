class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :menus, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes , dependent: :destroy

    attachment :profile_image

    validates :name, presence: true,length: {maximum: 10}
    validates :introduction,length: {maximum: 100}

end
