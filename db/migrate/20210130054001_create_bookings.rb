class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.float :total_price
      t.datetime :from
      t.datetime :till
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
