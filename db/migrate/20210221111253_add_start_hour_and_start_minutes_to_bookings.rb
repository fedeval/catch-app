class AddStartHourAndStartMinutesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :start_hour, :integer
    add_column :bookings, :start_minutes, :integer
  end
end
