class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable, :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :bikes, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :reservations, dependent: :destroy # added

end
