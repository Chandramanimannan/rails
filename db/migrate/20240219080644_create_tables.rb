class CreateTables < ActiveRecord::Migration[7.1]
  def change
    create_table :tables,id: false, primary_key: :merchantTxnId do |t|
      t.string :txnid, null: false
      t.string :paymentgateway, null: false
      t.string :merchantTxnId
      t.string :merchant, null: false
      t.string :orderNo
      t.string :MID
      t.string :cname, null: false
      t.string :email
      t.string :cardnumber, null: false
      t.string :cardtype, null: false
      t.string :country, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.string :currency, null: false
      t.string :Status, :default => "Pending"
      t.text :message, :default => "Transaction is in process"
      t.string :pdate
      t.integer :router
      t.string :webURL
      
      t.timestamps
    end
  end
end
