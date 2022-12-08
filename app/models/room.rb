class Room < ApplicationRecord
    has_one_attached :image
    belongs_to :user, optional: true,foreign_key: 'user_id'
    belongs_to :user, optional: true,foreign_key: 'reservation_id'
    
    has_many :reservations
    validates :room_name, presence: true
    validates :room_introduction, presence: true
    validates :price, presence: true, numericality: true
    validates :adress, presence: true
    
end
