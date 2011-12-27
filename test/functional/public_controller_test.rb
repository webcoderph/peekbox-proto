require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get company" do
    get :company
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
