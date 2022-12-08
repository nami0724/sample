class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :price
      t.string :adress
      t.string :image_id
      t.string :user_id


      t.timestamps
    end
  end
end
