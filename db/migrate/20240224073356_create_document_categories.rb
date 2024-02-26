class CreateDocumentCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :document_categories do |t|
      t.string :documentname
      t.string :documenttype
      t.string :side
      t.integer :documentnumberlength
      t.string :status, :default => "Active"

      t.timestamps
    end
  end
end
