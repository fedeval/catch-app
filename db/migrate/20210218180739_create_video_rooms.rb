class CreateVideoRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :video_rooms do |t|
      t.string :name
      t.string :session_id

      t.timestamps
    end
  end
end
