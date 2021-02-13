class CreateVideoSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :video_sessions do |t|
      t.references :first_match_id, foreign_key: { to_table: :users }
      t.references :second_match_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
