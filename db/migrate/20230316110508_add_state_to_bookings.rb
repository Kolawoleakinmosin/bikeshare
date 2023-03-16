class AddStateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :state, :boolean, default: false
  end
end
