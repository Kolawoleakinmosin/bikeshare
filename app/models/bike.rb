class Bike < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :address, :price, :title, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
