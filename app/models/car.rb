class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :locations, through: :reservations, dependent: :destroy
  has_one_attached :image
  validate :acceptable_image

  def acceptable_image
    return unless image.attached?
  end
end
