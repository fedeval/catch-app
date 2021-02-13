class AddEndTimeToVideoSession < ActiveRecord::Migration[6.0]
  def change
    add_column :video_sessions, :end_time, :date
  end
end
