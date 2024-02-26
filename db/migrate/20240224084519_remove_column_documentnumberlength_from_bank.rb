class RemoveColumnDocumentnumberlengthFromBank < ActiveRecord::Migration[7.1]
  def change
    remove_column :banks, :documentnumberlength
  end
end
