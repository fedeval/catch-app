class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_user_badges, class_name: 'UserBadge', dependent: :destroy, foreign_key: :sender_id
  has_many :received_user_badges, class_name: 'UserBadge', dependent: :destroy, foreign_key: :receiver_id
  has_many :messages, dependent: :destroy
  has_many :received_badges, through: :received_user_badges, source: :badge

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :username, presence: true
end
