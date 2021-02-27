class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User_badges validations
  has_many :sent_user_badges, class_name: 'UserBadge', dependent: :destroy, foreign_key: :sender_id
  has_many :received_user_badges, class_name: 'UserBadge', dependent: :destroy, foreign_key: :receiver_id
  has_many :received_badges, through: :received_user_badges, source: :badge

  # Messages validations
  has_many :messages, dependent: :destroy

  # Bookings validations
  has_many :bookings_as_user_one, class_name: 'Booking', dependent: :destroy, foreign_key: :user_one_id
  has_many :bookings_as_user_two, class_name: 'Booking', dependent: :destroy, foreign_key: :user_two_id
  
  # Attributes validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :username, presence: true

   # photo validations
   has_one_attached :photo
end
