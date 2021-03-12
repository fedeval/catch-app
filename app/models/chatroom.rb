class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :friendship, class_name: "HasFriendship::Friendship", dependent: :destroy
  validates :friendship, uniqueness: true
end
