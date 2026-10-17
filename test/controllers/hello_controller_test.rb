require "test_helper"

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "should get there" do
    get hello_there_url
    assert_response :success
  end
end
