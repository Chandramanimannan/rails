class CreateRates < ActiveRecord::Migration[7.1]
  def change
    create_table :rates do |t|
      t.string :settlement_scheme
      t.decimal :MDR, precision: 10, scale: 2
      t.decimal :txn_app , precision: 10, scale: 2
      t.decimal :txn_dec, precision: 10, scale: 2
      t.decimal :txn_total, precision: 10, scale: 2
      t.decimal :RR, precision: 10, scale: 2
      t.decimal :settlement_fee , precision: 10, scale: 2
      t.string :company_name, null: false
      t.timestamps

      
    end
  end
end
