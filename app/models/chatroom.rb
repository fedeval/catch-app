class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :friendship, class_name: "HasFriendship::Friendship"
  validates :friendship, uniqueness: true
end
