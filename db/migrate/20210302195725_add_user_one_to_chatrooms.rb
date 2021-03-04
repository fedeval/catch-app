class AddUserOneToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :user_one, :string
  end
end
