class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :model, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  validates :year, presence: true
  validates :price_per_day, presence: true
  validates :place, presence: true
  validates :photo, presence: true
end
