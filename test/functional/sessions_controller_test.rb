require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get switch_color" do
    get :switch_color
    assert_response :success
  end

end
