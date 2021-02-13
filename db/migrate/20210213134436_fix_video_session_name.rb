class FixVideoSessionName < ActiveRecord::Migration[6.0]
  def change
    rename_column :video_sessions, :first_match_id_id, :first_match
    rename_column :video_sessions, :second_match_id_id, :second_match
  end
end
