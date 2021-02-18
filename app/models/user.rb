class User < ApplicationRecord
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :badges

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :username, presence: true

end
