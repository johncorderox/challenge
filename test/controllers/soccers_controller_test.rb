require 'test_helper'

class SoccersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soccer = soccers(:one)
  end

  test "should get index" do
    get soccers_url
    assert_response :success
  end

  test "should get new" do
    get new_soccer_url
    assert_response :success
  end

  test "should create soccer" do
    assert_difference('Soccer.count') do
      post soccers_url, params: { soccer: { against: @soccer.against, for: @soccer.for, name: @soccer.name } }
    end

    assert_redirected_to soccer_url(Soccer.last)
  end

  test "should show soccer" do
    get soccer_url(@soccer)
    assert_response :success
  end

  test "should get edit" do
    get edit_soccer_url(@soccer)
    assert_response :success
  end

  test "should update soccer" do
    patch soccer_url(@soccer), params: { soccer: { against: @soccer.against, for: @soccer.for, name: @soccer.name } }
    assert_redirected_to soccer_url(@soccer)
  end

  test "should destroy soccer" do
    assert_difference('Soccer.count', -1) do
      delete soccer_url(@soccer)
    end

    assert_redirected_to soccers_url
  end
end
