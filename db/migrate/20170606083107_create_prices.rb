class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer     :price, null: false
      t.string      :currency, null: false
      t.references  :room, foreign_key: true
      t.timestamps
    end
  end
end
