class AddIndexToAlbums < ActiveRecord::Migration[5.2]
  # Migration for adding index to album relation
  def change
    add_index :albums, :title, unique: true
  end
end
