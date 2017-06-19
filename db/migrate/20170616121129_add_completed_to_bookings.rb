class AddCompletedToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :completed, :boolean, default: false, null: false
  end
end
