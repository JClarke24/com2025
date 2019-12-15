class CreateAlbums < ActiveRecord::Migration[5.2]
  # Migration for album relation
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.text :description
      t.date :date, null: false

      t.timestamps
    end
  end
end
