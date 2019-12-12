class AddUsersToAlbums < ActiveRecord::Migration[5.2]
  def up
    add_reference :albums, :user, index: true
    Album.reset_column_information
    user = User.first

    Album.all.each do |album|
      album.user_id = user.id
      album.save!
    end

    change_column_null :albums, :user_id, false
    add_foreign_key :albums, :users
  end

  def down
    remove_foreign_key :albums, :users
    remove_reference :albums, :user, index: true
  end
end
