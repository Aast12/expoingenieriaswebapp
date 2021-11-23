require 'test_helper'

class DaysgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daysgroup = daysgroups(:one)
  end

  test "should get index" do
    get daysgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_daysgroup_url
    assert_response :success
  end

  test "should create daysgroup" do
    assert_difference('Daysgroup.count') do
      post daysgroups_url, params: { daysgroup: { day: @daysgroup.day, group: @daysgroup.group } }
    end

    assert_redirected_to daysgroup_url(Daysgroup.last)
  end

  test "should show daysgroup" do
    get daysgroup_url(@daysgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_daysgroup_url(@daysgroup)
    assert_response :success
  end

  test "should update daysgroup" do
    patch daysgroup_url(@daysgroup), params: { daysgroup: { day: @daysgroup.day, group: @daysgroup.group } }
    assert_redirected_to daysgroup_url(@daysgroup)
  end

  test "should destroy daysgroup" do
    assert_difference('Daysgroup.count', -1) do
      delete daysgroup_url(@daysgroup)
    end

    assert_redirected_to daysgroups_url
  end
end
