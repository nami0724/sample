class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :place
      t.date :start_date
      t.date :end_date
      t.string :round
      t.string :hensyu
      t.string :sakujo
      t.string :plan
      t.date :plan_date
      t.string :plan_id
      t.timestamps
    end
  end
end
