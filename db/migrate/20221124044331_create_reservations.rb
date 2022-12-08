class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :person
      t.string :period
      t.string :total_price
      t.string :user_id
      t.string :room_id
      
      t.timestamps
    end
  end
end
