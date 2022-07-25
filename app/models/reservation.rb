class Reservation < ApplicationRecord
  belongs_to :bike
  belongs_to :location
  belongs_to :user

  validates :reservation_number, presence: true, numericality: { in: 1..5 }
  validates :date_reserved, presence: true
end
