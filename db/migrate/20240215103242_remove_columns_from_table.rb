class RemoveColumnsFromTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :acquirers, :id
    remove_column :acquirers, :acquirer_name
    remove_column :clients, :id
    remove_column :clients, :company_name
    remove_column :users, :id
    remove_column :users, :email
  end
end
