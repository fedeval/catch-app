class AddUserTwoToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :user_two, :string
  end
end
