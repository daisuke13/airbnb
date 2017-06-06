class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer     :postal_code, null: false
      t.string      :prefecture, null: false
      t.string      :city, null: false
      t.string      :street_address, null: false
      t.string      :building, null: false
      t.references  :room, foreign_key:true
      t.timestamps
    end
  end
end
