require 'test_helper'

class StaffMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_member = staff_members(:one)
  end

  test "should get index" do
    get staff_members_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_member_url
    assert_response :success
  end

  test "should create staff_member" do
    assert_difference('StaffMember.count') do
      post staff_members_url, params: { staff_member: {  } }
    end

    assert_redirected_to staff_member_url(StaffMember.last)
  end

  test "should show staff_member" do
    get staff_member_url(@staff_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_member_url(@staff_member)
    assert_response :success
  end

  test "should update staff_member" do
    patch staff_member_url(@staff_member), params: { staff_member: {  } }
    assert_redirected_to staff_member_url(@staff_member)
  end

  test "should destroy staff_member" do
    assert_difference('StaffMember.count', -1) do
      delete staff_member_url(@staff_member)
    end

    assert_redirected_to staff_members_url
  end
end
