class RenameColumnInSongs < ActiveRecord::Migration[5.0]
  def change
    rename_column :songs, :artst_name, :artist_name
  end
end
