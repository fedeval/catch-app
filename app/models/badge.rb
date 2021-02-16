class Badge < ApplicationRecord
  has_many :users
  validates :type, presence: true
  validates :content, presence: true
end
