class Booking < ApplicationRecord
  validates :start_hour, presence: true, numericality: { in: (0..24) }
  validates :start_minutes, presence: true, numericality: { in: (0...60) }

  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User'
end
