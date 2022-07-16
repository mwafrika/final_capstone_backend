class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :locations, through: :reservations, dependent: :destroy
end
