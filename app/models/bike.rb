class Bike < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_address,
    against: [ :title, :address ],
    using: {
      tsearch: { prefix: true }
    }

  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :address, :price, :title, :photos, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
