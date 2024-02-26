class CreateBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :banks do |t|
      t.string :bankname
      t.string :divid
      t.string :bankurl
      t.integer :documentnumberlength
      t.string :status, :default => "Active"
      t.timestamps
    end
  end
end
