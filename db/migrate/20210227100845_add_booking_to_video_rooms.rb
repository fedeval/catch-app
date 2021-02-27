class AddBookingToVideoRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :video_rooms, :booking, null: false, foreign_key: true
  end
end
