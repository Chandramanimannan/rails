class CreateTransactiontables < ActiveRecord::Migration[7.1]
  def change
    create_table :transactiontables do |t|
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
      t.datetime :transactiondate
      t.string :Status, :default => "Pending"
      t.text :message, :default => "Transaction is in process"
      t.datetime :pdate
      t.integer :router
      t.string :webURL
      t.timestamps
    end
  end
end
