class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable, :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :bikes, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :reservations, dependent: :destroy # added

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true, length: { minimum: 5, maximum: 500 }
end
