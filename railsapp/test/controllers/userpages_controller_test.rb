require "test_helper"

class UserpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get userpages_show_url
    assert_response :success
  end
end
