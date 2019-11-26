class AddIndexToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_index :albums, :title, unique: true
  end
end
