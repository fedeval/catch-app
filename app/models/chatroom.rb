class Chatroom < ApplicationRecord
  has_many :messages
  validates :maximum_users_per_chatroom

  private
  def maximum_users_per_chatroom
    user.count <= 2
  end
end
