require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  # Called before any test. User fixtures to instantiate user.
  setup do
    @user = users(:one)
  end

  # Tests empty album shouldn't be saved
  test 'should not save empty album' do
    album = Album.new

    album.save
    refute album.valid?
  end

  # Tests an album should be saved
  test 'should save valid album' do
    album = Album.new

    album.user = @user
    album.title = 'My Album'
    album.description = 'The best of all albums'
    album.date = Date.current()

    album.save
    assert album.valid?
  end

  # Tests album with same title shouldn't be saved
  test 'should not save duplicate album title' do
    album1 = Album.new
    album1.user = @user
    album1.title = 'My Album'
    album1.description = 'The best of all albums'
    album1.date = Date.current()
    album1.save
    assert album1.valid?

    album2 = Album.new
    album2.user = @user
    album2.title = 'My Album'
    album2.description = 'The best of all albums'
    album2.date = Date.current()
    album2.save
    refute album2.valid?
  end
end
