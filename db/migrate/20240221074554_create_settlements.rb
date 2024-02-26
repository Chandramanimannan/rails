class CreateSettlements < ActiveRecord::Migration[7.1]
  def change
    create_table :settlements do |t|
 
      t.date :date_settled
      t.decimal :total_volume, precision: 10, scale: 2
      t.decimal :settlement_volume , precision: 10, scale: 2
      t.string :status, :default => "Pending"
      t.string :company_name, null: false
      t.timestamps
    end
  end
end
