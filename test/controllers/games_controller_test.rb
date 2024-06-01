require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get shooting" do
    get games_shooting_url
    assert_response :success
  end
end
