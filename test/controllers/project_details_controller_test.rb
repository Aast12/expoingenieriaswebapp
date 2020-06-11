require 'test_helper'

class ProjectDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_detail = project_details(:one)
  end

  test "should get index" do
    get project_details_url
    assert_response :success
  end

  test "should get new" do
    get new_project_detail_url
    assert_response :success
  end

  test "should create project_detail" do
    assert_difference('ProjectDetail.count') do
      post project_details_url, params: { project_detail: { client_type: @project_detail.client_type, description: @project_detail.description, name: @project_detail.name, project_id: @project_detail.project_id, semestre_i: @project_detail.semestre_i, social_impact: @project_detail.social_impact, video_url: @project_detail.video_url } }
    end

    assert_redirected_to project_detail_url(ProjectDetail.last)
  end

  test "should show project_detail" do
    get project_detail_url(@project_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_detail_url(@project_detail)
    assert_response :success
  end

  test "should update project_detail" do
    patch project_detail_url(@project_detail), params: { project_detail: { client_type: @project_detail.client_type, description: @project_detail.description, name: @project_detail.name, project_id: @project_detail.project_id, semestre_i: @project_detail.semestre_i, social_impact: @project_detail.social_impact, video_url: @project_detail.video_url } }
    assert_redirected_to project_detail_url(@project_detail)
  end

  test "should destroy project_detail" do
    assert_difference('ProjectDetail.count', -1) do
      delete project_detail_url(@project_detail)
    end

    assert_redirected_to project_details_url
  end
end
