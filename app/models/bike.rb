class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :location, :price, presence: true
end
