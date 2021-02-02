require 'test_helper'

class BikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bikes_index_url
    assert_response :success
  end

  test "should get show" do
    get bikes_show_url
    assert_response :success
  end

end
