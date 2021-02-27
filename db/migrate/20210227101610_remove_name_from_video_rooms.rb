class RemoveNameFromVideoRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :video_rooms, :name
  end
end
