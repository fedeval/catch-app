class Badge < ApplicationRecord
  validates :type, presence: true
  validates :content, presence: true
end
