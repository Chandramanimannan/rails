class AddCOlumnToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :last_settled_date, :string
  end
end
