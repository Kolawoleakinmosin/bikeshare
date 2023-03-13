class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :location, :price, :title, presence: true
end
