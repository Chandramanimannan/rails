class AddCustomKeyToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :acquirers, :acquirer_name, :string, primary_key: true
    add_index :acquirers, :acquirer_name, unique: true
    add_column :clients, :company_name, :string, primary_key: true
    add_index :clients, :company_name, unique: true
    add_column :users, :email, :string, primary_key: true
    add_index :users, :email, unique: true
    add_foreign_key :clients, :acquirers, column: :acquirer_name, primary_key: :acquirer_name
    add_foreign_key :users, :clients, column: :company_name, primary_key: :company_name
  end
end
