class AddCreditToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :billing_address, :string
    add_column :users, :card_number, :integer
    add_column :users, :expiration_date, :date
  end
end
