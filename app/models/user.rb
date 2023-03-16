class User < ApplicationRecord
  has_many :bookings
  has_many :bikes
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def my_booked_bikes
    bookings.map do |booking|
      booking.bike
    end
  end
end
