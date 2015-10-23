require 'test_helper'

class BloggrControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
