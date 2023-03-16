class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  validates :start_time, :end_time, :message, presence: true

  def total_sum
    price_per_day = self.bike.price
    days_booked = (self.end_time - self.start_time).to_i
    total_sum = price_per_day * days_booked
    return total_sum
  end
end
