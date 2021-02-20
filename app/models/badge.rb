class Badge < ApplicationRecord
  has_many :users
  has_many :user_badges
  validates :type, presence: true
  validates :content, presence: true
end
