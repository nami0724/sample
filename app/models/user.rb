class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :reservations
   has_many :rooms
   has_one_attached :image_id

   validates :name, presence: true
   validates :introduction, presence: true
   validates :image_id, presence: true
   validates :email, presence: true
   validates :password, presence: true
   
   
end
