class AddForeignKeyToSettlement < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :settlements, :clients, column: :company_name, primary_key: :company_name
  end
end
