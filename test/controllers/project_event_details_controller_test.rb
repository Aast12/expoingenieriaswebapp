require 'test_helper'

class ProjectEventDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_event_detail = project_event_details(:one)
  end

  test "should get index" do
    get project_event_details_url
    assert_response :success
  end

  test "should get new" do
    get new_project_event_detail_url
    assert_response :success
  end

  test "should create project_event_detail" do
    assert_difference('ProjectEventDetail.count') do
      post project_event_details_url, params: { project_event_detail: { final_score: @project_event_detail.final_score, project_id: @project_event_detail.project_id, stand: @project_event_detail.stand } }
    end

    assert_redirected_to project_event_detail_url(ProjectEventDetail.last)
  end

  test "should show project_event_detail" do
    get project_event_detail_url(@project_event_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_event_detail_url(@project_event_detail)
    assert_response :success
  end

  test "should update project_event_detail" do
    patch project_event_detail_url(@project_event_detail), params: { project_event_detail: { final_score: @project_event_detail.final_score, project_id: @project_event_detail.project_id, stand: @project_event_detail.stand } }
    assert_redirected_to project_event_detail_url(@project_event_detail)
  end

  test "should destroy project_event_detail" do
    assert_difference('ProjectEventDetail.count', -1) do
      delete project_event_detail_url(@project_event_detail)
    end

    assert_redirected_to project_event_details_url
  end
end
