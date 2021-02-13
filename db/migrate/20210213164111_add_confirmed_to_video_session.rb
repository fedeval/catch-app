class AddConfirmedToVideoSession < ActiveRecord::Migration[6.0]
  def change
    add_column :video_sessions, :confirmed, :boolean
  end
end
