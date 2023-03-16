class RemoveDateStartAndDateEndFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :date_start, :date
    remove_column :bookings, :date_end, :date
  end
end
