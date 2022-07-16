class Location < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent: :destroy
    has_many :cars, through: :reservations, dependent: :destroy
end
