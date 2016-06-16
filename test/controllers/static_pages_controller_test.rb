require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get universities" do
    get :universities
    assert_response :success
  end

  test "should get services" do
    get :services
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

end
