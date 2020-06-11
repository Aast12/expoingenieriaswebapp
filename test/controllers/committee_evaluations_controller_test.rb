require 'test_helper'

class CommitteeEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @committee_evaluation = committee_evaluations(:one)
  end

  test "should get index" do
    get committee_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_committee_evaluation_url
    assert_response :success
  end

  test "should create committee_evaluation" do
    assert_difference('CommitteeEvaluation.count') do
      post committee_evaluations_url, params: { committee_evaluation: { description: @committee_evaluation.description, feasibility: @committee_evaluation.feasibility, impact: @committee_evaluation.impact, methodology: @committee_evaluation.methodology, problem: @committee_evaluation.problem, project_id: @committee_evaluation.project_id, results: @committee_evaluation.results, score: @committee_evaluation.score } }
    end

    assert_redirected_to committee_evaluation_url(CommitteeEvaluation.last)
  end

  test "should show committee_evaluation" do
    get committee_evaluation_url(@committee_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_committee_evaluation_url(@committee_evaluation)
    assert_response :success
  end

  test "should update committee_evaluation" do
    patch committee_evaluation_url(@committee_evaluation), params: { committee_evaluation: { description: @committee_evaluation.description, feasibility: @committee_evaluation.feasibility, impact: @committee_evaluation.impact, methodology: @committee_evaluation.methodology, problem: @committee_evaluation.problem, project_id: @committee_evaluation.project_id, results: @committee_evaluation.results, score: @committee_evaluation.score } }
    assert_redirected_to committee_evaluation_url(@committee_evaluation)
  end

  test "should destroy committee_evaluation" do
    assert_difference('CommitteeEvaluation.count', -1) do
      delete committee_evaluation_url(@committee_evaluation)
    end

    assert_redirected_to committee_evaluations_url
  end
end
