class RemoveUserOneFromChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :user_one
    remove_column :chatrooms, :user_two
  end
end
