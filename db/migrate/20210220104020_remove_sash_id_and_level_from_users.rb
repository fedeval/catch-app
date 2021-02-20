class RemoveSashIdAndLevelFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :sash_id
    remove_column :users, :level
  end
end
