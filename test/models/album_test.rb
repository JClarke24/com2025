require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'should not save empty album' do
    album = Album.new

    album.save
    refute album.valid?
  end

  test 'should save valid album' do
    album = Album.new

    album.user = @user
    album.title = 'My Album'
    album.description = 'The best of all albums'
    album.date = Date.current()

    album.save
    assert album.valid?
  end

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
