class CreateClients < ActiveRecord::Migration[7.1]
  def change
   
    create_table :clients do |t|
      t.string :company_name
      t.string :company_type
      t.string :website_url, null: false
      t.string :company_email, null: false
      t.string :city
      t.string :status, :default => "Active"
      t.string :acquirer_name, null: false

      t.timestamps
    end
  end
end
