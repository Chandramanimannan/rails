class CreateDocumentTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :document_types do |t|
      t.string :documenttype
      t.string :status, :default => "Active"
      t.timestamps
    end
  end
end
