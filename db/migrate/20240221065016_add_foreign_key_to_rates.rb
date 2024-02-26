class AddForeignKeyToRates < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :rates, :clients, column: :company_name, primary_key: :company_name
  end
end
