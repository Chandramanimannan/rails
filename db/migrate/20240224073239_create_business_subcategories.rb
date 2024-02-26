class CreateBusinessSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :business_subcategories do |t|
      t.string :subcategoryname
      t.string :categoryname
      t.string :status, :default => "Active"
      t.timestamps
    end
  end
end
