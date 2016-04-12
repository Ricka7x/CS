require 'test_helper'

class ChargesControllerTest < ActionController::TestCase
  test "should get free" do
    get :free
    assert_response :success
  end

end
