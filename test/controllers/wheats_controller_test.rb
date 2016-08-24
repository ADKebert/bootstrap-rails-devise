require 'test_helper'

class WheatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wheat = wheats(:one)
  end

  test "should get index" do
    get wheats_url
    assert_response :success
  end

  test "should get new" do
    get new_wheat_url
    assert_response :success
  end

  test "should create wheat" do
    assert_difference('Wheat.count') do
      post wheats_url, params: { wheat: { user_id: @wheat.user_id, x: @wheat.x, y: @wheat.y } }
    end

    assert_redirected_to wheat_url(Wheat.last)
  end

  test "should show wheat" do
    get wheat_url(@wheat)
    assert_response :success
  end

  test "should get edit" do
    get edit_wheat_url(@wheat)
    assert_response :success
  end

  test "should update wheat" do
    patch wheat_url(@wheat), params: { wheat: { user_id: @wheat.user_id, x: @wheat.x, y: @wheat.y } }
    assert_redirected_to wheat_url(@wheat)
  end

  test "should destroy wheat" do
    assert_difference('Wheat.count', -1) do
      delete wheat_url(@wheat)
    end

    assert_redirected_to wheats_url
  end
end
