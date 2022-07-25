class Location < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :bikes, through: :reservations, dependent: :destroy
  validates :full_address, presence: true, length:{maximum: 500}
end
