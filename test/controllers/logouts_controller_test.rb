require 'test_helper'

class LogoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get logouts_show_url
    assert_response :success
  end

end
