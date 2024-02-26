class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :categoryname
      t.string :shortname
      t.string :status, :default => "Active"
      t.timestamps
    end
  end
end
