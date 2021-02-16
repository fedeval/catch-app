class AddLengthToVideoSession < ActiveRecord::Migration[6.0]
  def change
    add_column :video_sessions, :length, :integer
  end
end
