require 'test_helper'

class AcademicLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_level = academic_levels(:one)
  end

  test "should get index" do
    get academic_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_level_url
    assert_response :success
  end

  test "should create academic_level" do
    assert_difference('AcademicLevel.count') do
      post academic_levels_url, params: { academic_level: { name: @academic_level.name } }
    end

    assert_redirected_to academic_level_url(AcademicLevel.last)
  end

  test "should show academic_level" do
    get academic_level_url(@academic_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_level_url(@academic_level)
    assert_response :success
  end

  test "should update academic_level" do
    patch academic_level_url(@academic_level), params: { academic_level: { name: @academic_level.name } }
    assert_redirected_to academic_level_url(@academic_level)
  end

  test "should destroy academic_level" do
    assert_difference('AcademicLevel.count', -1) do
      delete academic_level_url(@academic_level)
    end

    assert_redirected_to academic_levels_url
  end
end
