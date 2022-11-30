class Room < ApplicationRecord
    has_one_attached :image
    belongs_to :user ,foreign_key: 'user_id'
    belongs_to :user ,foreign_key: 'reservation_id'
end
