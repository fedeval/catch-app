class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
  
  validates :category, presence: true
  validates :content, presence: true
end
