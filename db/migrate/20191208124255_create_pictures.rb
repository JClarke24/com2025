class CreatePictures < ActiveRecord::Migration[5.2]
  # Migration for picture relation
  def change
    create_table :pictures do |t|
      t.belongs_to :album, index: true, foreign_key: true, null:false
      t.string :title, null:false
      t.date :date, null:false

      t.timestamps
    end
  end
end
