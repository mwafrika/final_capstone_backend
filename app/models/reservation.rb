class Reservation < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  # added
  validates :bike_id, presence: true
  validates :user_id, presence: true
  #added
  validates :city, presence: true
  validates :date_reserved, presence: true
end
