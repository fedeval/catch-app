class AddStartTimeToVideoSession < ActiveRecord::Migration[6.0]
  def change
    add_column :video_sessions, :start_time, :date
  end
end
