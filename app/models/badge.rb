class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :user_badges
  
  validates :type, presence: true
  validates :content, presence: true
end
