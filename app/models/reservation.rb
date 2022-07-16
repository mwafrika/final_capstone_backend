class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :location
  belongs_to :user
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :start_date, :end_date, overlap: {
  #     scope: 'car_id',
  #     message_for_overlap: 'The car is already reserved for this period of time.'
  # }
end
