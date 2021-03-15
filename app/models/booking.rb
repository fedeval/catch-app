class Booking < ApplicationRecord
  validates :start_time, presence: true
  validates :user_one, presence: true
  has_one :video_room, dependent: :destroy

  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User', optional: true

  self.skip_time_zone_conversion_for_attributes = [:start_time]

  def start_time=(time)
    write_attribute(:start_time, time ? time + time.utc_offset : nil)
  end

  def start_time
    t = read_attribute(:start_time)
    t ? Time.local(t.year, t.month, t.day, t.hour, t.min, t.sec) : nil
  end

  def self.unavailable_times
    unconfirmed_bookings = Booking.all.where(user_two: nil).order('start_time ASC')
    ub = unconfirmed_bookings.select { |booking| booking.start_time > Time.now + (1 * 3600) && booking.start_time < Time.now + (3 * 3600) }
    ub.map { |booking| [booking.start_time.strftime('%I:%M%P'), (booking.start_time + (60 * 2)).strftime('%I:%M%P')] }
  end
end
