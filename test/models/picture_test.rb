require 'test_helper'

class PictureTest < ActiveSupport::TestCase

  setup do
    @album = albums(:one)
  end

  test 'should not save empty picture' do
    picture = Picture.new

    picture.save
    refute picture.valid?
  end

  test 'should save valid picture' do
    picture = Picture.new

    picture.title = 'My Picture'
    picture.album = @album
    picture.date = Date.current()

    picture.save
    assert picture.valid?
  end
end
