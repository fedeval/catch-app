class DropStartHourAndStartMinutesFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :start_hour
    remove_column :bookings, :start_minutes
  end
end
