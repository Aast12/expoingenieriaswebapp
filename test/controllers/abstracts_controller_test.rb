require 'test_helper'

class AbstractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract = abstracts(:one)
  end

  test "should get index" do
    get abstracts_url
    assert_response :success
  end

  test "should get new" do
    get new_abstract_url
    assert_response :success
  end

  test "should create abstract" do
    assert_difference('Abstract.count') do
      post abstracts_url, params: { abstract: { feasibility: @abstract.feasibility, impact: @abstract.impact, methodology: @abstract.methodology, problem: @abstract.problem, project_id: @abstract.project_id, results: @abstract.results } }
    end

    assert_redirected_to abstract_url(Abstract.last)
  end

  test "should show abstract" do
    get abstract_url(@abstract)
    assert_response :success
  end

  test "should get edit" do
    get edit_abstract_url(@abstract)
    assert_response :success
  end

  test "should update abstract" do
    patch abstract_url(@abstract), params: { abstract: { feasibility: @abstract.feasibility, impact: @abstract.impact, methodology: @abstract.methodology, problem: @abstract.problem, project_id: @abstract.project_id, results: @abstract.results } }
    assert_redirected_to abstract_url(@abstract)
  end

  test "should destroy abstract" do
    assert_difference('Abstract.count', -1) do
      delete abstract_url(@abstract)
    end

    assert_redirected_to abstracts_url
  end
end
