require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get reviews_show_url
    assert_response :success
  end

end
