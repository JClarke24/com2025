require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Called before tests. Uses fixtures to instantiate picture, album and user. Signs in as user.
  setup do
    @picture = pictures(:one)
    @album = albums(:one)
    @user = users(:one)
    sign_in @user
  end

  # Tests the picture new action
  test "should get new" do
    get new_album_picture_url(album_id: @picture.album_id)
    assert_response :success

    assert_select 'title', 'My Gallery'
    assert_select 'h1', 'New Picture'
  end

  # Tests the picture create action
  test "should create picture" do
    assert_difference('Picture.count') do
      post album_pictures_url(@album), params: { picture: { album_id: @picture.album_id, date: @picture.date, title: @picture.title } }
    end

    assert_redirected_to album_picture_url(@album, Picture.last)
  end

  # Tests the picture show action
  test "should show picture" do
    get album_picture_url(@album, @picture)
    assert_response :success

    assert_select 'title', 'My Gallery'
  end

  # Tests the picture destroy action
  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete album_picture_url(@album, @picture)
    end

    assert_redirected_to album_url(@album)
  end
end
