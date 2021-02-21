class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.time :start_time
      t.bigint :user_one_id
      t.bigint :user_two_id

      t.timestamps
    end
  end
end
