require 'test_helper'

class OperativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operative = operatives(:one)
  end

  test "should get index" do
    get operatives_url
    assert_response :success
  end

  test "should get new" do
    get new_operative_url
    assert_response :success
  end

  test "should create operative" do
    assert_difference('Operative.count') do
      post operatives_url, params: { operative: {  } }
    end

    assert_redirected_to operative_url(Operative.last)
  end

  test "should show operative" do
    get operative_url(@operative)
    assert_response :success
  end

  test "should get edit" do
    get edit_operative_url(@operative)
    assert_response :success
  end

  test "should update operative" do
    patch operative_url(@operative), params: { operative: {  } }
    assert_redirected_to operative_url(@operative)
  end

  test "should destroy operative" do
    assert_difference('Operative.count', -1) do
      delete operative_url(@operative)
    end

    assert_redirected_to operatives_url
  end
end
