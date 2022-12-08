class Reservation < ApplicationRecord
    belongs_to :user, optional: true,foreign_key: 'user_id'
    belongs_to :room, optional: true
    validates :person, presence: true, numericality: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :date_before_start
    validate :date_before_finish

    def date_before_start
        return if start_date.blank?
        errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
      end
    
      def date_before_finish
        return if end_date.blank? || start_date.blank?
        errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
      end

      

# def subtotal
#     price.with_period * amount
end
