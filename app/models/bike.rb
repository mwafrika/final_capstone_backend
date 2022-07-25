class Bike < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :locations, through: :reservations, dependent: :destroy
  has_one_attached :image
  validates :acceptable_image
  validates :make, presence: true, length: { maximum: 50 }
  validates :price, presence: true, precision: 2, :numericality => {greater_or_to:0}
  validates :model, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :is_available, presence: true, inclusion:[true, false]

  def acceptable_image
    return unless image.attached?
  end

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
