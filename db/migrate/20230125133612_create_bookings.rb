class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.integer :duration
      t.boolean :is_active

      t.timestamps
    end
  end
end
