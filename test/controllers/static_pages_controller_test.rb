require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get current_season" do
    get :current_season
    assert_response :success
  end

  test "should get archive" do
    get :archive
    assert_response :success
  end

end
