class CreateBusinesstypes < ActiveRecord::Migration[7.1]
  def change
    create_table :businesstypes do |t|
      t.string :businesstypename
      t.string :status, :default => "Active"
      t.timestamps
    end
  end
end
