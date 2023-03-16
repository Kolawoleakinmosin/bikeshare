class AddStartTimeAndEndTimeToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :start_time, :date
    add_column :bookings, :end_time, :date
  end
end
