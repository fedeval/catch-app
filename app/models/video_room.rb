class VideoRoom < ApplicationRecord
  has_one :booking
  
  validates :booking_id, presence: true
end
