require 'test_helper'

class CollaboratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collaborator = collaborators(:one)
  end

  test "should get index" do
    get collaborators_url
    assert_response :success
  end

  test "should get new" do
    get new_collaborator_url
    assert_response :success
  end

  test "should create collaborator" do
    assert_difference('Collaborator.count') do
      post collaborators_url, params: { collaborator: { email: @collaborator.email, first_name: @collaborator.first_name, last_name: @collaborator.last_name, major: @collaborator.major, project_id: @collaborator.project_id, student_code: @collaborator.student_code } }
    end

    assert_redirected_to collaborator_url(Collaborator.last)
  end

  test "should show collaborator" do
    get collaborator_url(@collaborator)
    assert_response :success
  end

  test "should get edit" do
    get edit_collaborator_url(@collaborator)
    assert_response :success
  end

  test "should update collaborator" do
    patch collaborator_url(@collaborator), params: { collaborator: { email: @collaborator.email, first_name: @collaborator.first_name, last_name: @collaborator.last_name, major: @collaborator.major, project_id: @collaborator.project_id, student_code: @collaborator.student_code } }
    assert_redirected_to collaborator_url(@collaborator)
  end

  test "should destroy collaborator" do
    assert_difference('Collaborator.count', -1) do
      delete collaborator_url(@collaborator)
    end

    assert_redirected_to collaborators_url
  end
end
