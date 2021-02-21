class Booking < ApplicationRecord
  validates :start_time, presence: true, numericality: { greater_than: Time.now }

  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User'
end
