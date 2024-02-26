class AddTransactiondateToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :tables, :transactiondate, :string
  end
end
