require "test_helper"

class PhinaControllerTest < ActionDispatch::IntegrationTest
  test "should get js" do
    get phina_js_url
    assert_response :success
  end
end
