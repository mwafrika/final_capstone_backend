class Reservation < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :reservation_number, presence: true, numericality: { in: 1..15 }
  validates :date_reserved, presence: true
end
