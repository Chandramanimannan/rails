class CreateAcquirers < ActiveRecord::Migration[7.1]
  def change
    create_table :acquirers do |t|
      t.string :acquirer_name
      t.string :website_url, null: false
      t.string :acquirer_email, null: false
      t.string :city
      t.string :status, :default => "Active"

      t.timestamps
    end
  end
end
