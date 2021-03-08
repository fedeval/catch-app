class Booking < ApplicationRecord
  validates :start_time, presence: true
  validates :user_one, presence: true
  has_one :video_room, dependent: :destroy

  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User', optional: true

  def self.unavailable_times
    bookings = Booking.all.where(user_two: nil)
    unavailable_times = []
    bookings.each do |booking|
      nine_min_from_start_time = booking.start_time + (60 * 9)
      unavailable_times << [booking.start_time.strftime('%H:%M'), nine_min_from_start_time.strftime('%H:%M')]
    end
    unavailable_times
  end
end
