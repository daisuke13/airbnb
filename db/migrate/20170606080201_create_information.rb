class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.string      :room_type, null: false
      t.string      :room_category, null: false
      t.integer     :acceptance_number, null: false
      t.string      :bedrooms, null: false
      t.string      :beds, null: false
      t.string      :bathrooms, null: false
      t.references  :room, foreign_key: true
      t.timestamps
    end
  end
end
