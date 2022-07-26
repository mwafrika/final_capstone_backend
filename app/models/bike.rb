class Bike < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :locations, through: :reservations, dependent: :destroy
  has_one_attached :image
  validates :acceptable_image
  validates :make, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :model, presence: true
  validates :description, presence: true
  validates :is_available, presence: true

  def acceptable_image
    return unless image.attached?
  end

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
