require 'test_helper'

class ProjectAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_area = project_areas(:one)
  end

  test "should get index" do
    get project_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_project_area_url
    assert_response :success
  end

  test "should create project_area" do
    assert_difference('ProjectArea.count') do
      post project_areas_url, params: { project_area: { name: @project_area.name } }
    end

    assert_redirected_to project_area_url(ProjectArea.last)
  end

  test "should show project_area" do
    get project_area_url(@project_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_area_url(@project_area)
    assert_response :success
  end

  test "should update project_area" do
    patch project_area_url(@project_area), params: { project_area: { name: @project_area.name } }
    assert_redirected_to project_area_url(@project_area)
  end

  test "should destroy project_area" do
    assert_difference('ProjectArea.count', -1) do
      delete project_area_url(@project_area)
    end

    assert_redirected_to project_areas_url
  end
end
