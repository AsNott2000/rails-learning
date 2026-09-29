require "test_helper"

class BurrsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get burrs_index_url
    assert_response :success
  end
end
