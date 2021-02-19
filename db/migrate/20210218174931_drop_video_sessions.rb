class DropVideoSessions < ActiveRecord::Migration[6.0]
  def change
    drop_table :video_sessions
  end
end
