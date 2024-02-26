class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :currencyname
      t.string :currencycode
      t.string :status, :default => "Active"
      t.timestamps
    end
  end
end
