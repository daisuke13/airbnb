class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string      :name, null: false
      t.string      :image, null: false
      t.string      :url, null: false
      t.references  :room, foreign_key: true
      t.timestamps
    end
  end
end
