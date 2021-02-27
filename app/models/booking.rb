class Booking < ApplicationRecord
  validates :start_time, presence: true
  validates :user_one, presence: true
  has_one :video_room, dependent: :destroy

  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User', optional: true
end
