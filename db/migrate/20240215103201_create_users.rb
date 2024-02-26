class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :mobile_no
      t.string :country
      t.string :company_name, null: false
      t.string :role, null: false, :default => "user"
      t.string :password_digest

      t.timestamps
    end
  end
end
