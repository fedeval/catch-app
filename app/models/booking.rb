class Booking < ApplicationRecord
  validates :start_time, presence: true
  validates :user_one, presence: true

  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User', optional: true
  belongs_to :video_room, optional: true
end
