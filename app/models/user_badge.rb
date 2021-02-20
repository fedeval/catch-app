class UserBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
end
