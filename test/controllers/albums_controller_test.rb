require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Called before tests. Uses fixtures to instantiate album and user. Signs in as user.
  setup do
    @album = albums(:one)
    @user = users(:one)
    sign_in @user
  end

  # Tests the album index action
  test "should get index" do
    get albums_url
    assert_response :success

    assert_select 'title', 'My Gallery'
    assert_select 'h1', 'Albums'
  end

  # Tests the album new action
  test "should get new" do
    get new_album_url
    assert_response :success

    assert_select 'title', 'My Gallery'
    assert_select 'h1', 'New Album'
  end

  # Tests the album create action
  test "should create album" do
    assert_difference('Album.count') do
      post albums_url, params: { album: { date: @album.date, description: @album.description, title: @album.title + " create"} }
    end

    assert_redirected_to album_url(Album.last)
  end

  # Tests the album show action
  test "should show album" do
    get album_url(@album)
    assert_response :success

    assert_select 'title', 'My Gallery'
    assert_select 'h1', @album.title
  end

  # Tests the album edit action
  test "should get edit" do
    get edit_album_url(@album)
    assert_response :success

    assert_select 'title', 'My Gallery'
    assert_select 'h1', 'Editing Album'
  end

  # Tests the album update action
  test "should update album" do
    patch album_url(@album), params: { album: { date: @album.date, description: @album.description, title: @album.title } }
    assert_redirected_to album_url(@album)
  end

  # Tests the album destroy action
  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete album_url(@album)
    end

    assert_redirected_to albums_url
  end
end
