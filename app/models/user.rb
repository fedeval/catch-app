class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :badges
  has_many :user_badges

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :username, presence: true

end
