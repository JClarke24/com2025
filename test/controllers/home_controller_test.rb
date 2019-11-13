require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'My Gallery'
    assert_select 'h1', 'My Gallery'
    assert_select 'h2', 'Welcome to My Gallery, Where all your favorite memories can be together...'
  end

end
