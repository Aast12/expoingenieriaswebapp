require 'test_helper'

class CommitteeMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @committee_member = committee_members(:one)
  end

  test "should get index" do
    get committee_members_url
    assert_response :success
  end

  test "should get new" do
    get new_committee_member_url
    assert_response :success
  end

  test "should create committee_member" do
    assert_difference('CommitteeMember.count') do
      post committee_members_url, params: { committee_member: {  } }
    end

    assert_redirected_to committee_member_url(CommitteeMember.last)
  end

  test "should show committee_member" do
    get committee_member_url(@committee_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_committee_member_url(@committee_member)
    assert_response :success
  end

  test "should update committee_member" do
    patch committee_member_url(@committee_member), params: { committee_member: {  } }
    assert_redirected_to committee_member_url(@committee_member)
  end

  test "should destroy committee_member" do
    assert_difference('CommitteeMember.count', -1) do
      delete committee_member_url(@committee_member)
    end

    assert_redirected_to committee_members_url
  end
end
