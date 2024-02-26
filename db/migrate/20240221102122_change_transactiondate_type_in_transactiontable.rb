class ChangeTransactiondateTypeInTransactiontable < ActiveRecord::Migration[7.1]
  def change
    
    change_column :transactiontables, :transactiondate, :string
  
  end
end
