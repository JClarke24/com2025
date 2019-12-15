class AddAttachmentImageToAlbums < ActiveRecord::Migration[5.2]
  # Migration to add an image to album relation
  def self.up
    change_table :albums do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :albums, :image
  end
end
