class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date        :check_in, null: false
      t.date        :check_out, null: false
      t.string      :guest, null: false
      t.references  :user, foreign_key: true
      t.references  :room, foreign_key: true
      t.timestamps
    end
  end
end
