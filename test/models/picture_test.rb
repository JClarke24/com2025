require 'test_helper'

class PictureTest < ActiveSupport::TestCase

  # Called before any test. User fixtures to instantiate album.
  setup do
    @album = albums(:one)
  end

  # Tests empty picture shouldn't be saved
  test 'should not save empty picture' do
    picture = Picture.new

    picture.save
    refute picture.valid?
  end

  # Tests a picture should be saved
  test 'should save valid picture' do
    picture = Picture.new

    picture.title = 'My Picture'
    picture.album = @album
    picture.date = Date.current()

    picture.save
    assert picture.valid?
  end
end
