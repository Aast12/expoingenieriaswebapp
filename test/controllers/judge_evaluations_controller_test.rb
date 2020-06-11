require 'test_helper'

class JudgeEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @judge_evaluation = judge_evaluations(:one)
  end

  test "should get index" do
    get judge_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_judge_evaluation_url
    assert_response :success
  end

  test "should create judge_evaluation" do
    assert_difference('JudgeEvaluation.count') do
      post judge_evaluations_url, params: { judge_evaluation: { judge_id: @judge_evaluation.judge_id, project_id: @judge_evaluation.project_id, score: @judge_evaluation.score } }
    end

    assert_redirected_to judge_evaluation_url(JudgeEvaluation.last)
  end

  test "should show judge_evaluation" do
    get judge_evaluation_url(@judge_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_judge_evaluation_url(@judge_evaluation)
    assert_response :success
  end

  test "should update judge_evaluation" do
    patch judge_evaluation_url(@judge_evaluation), params: { judge_evaluation: { judge_id: @judge_evaluation.judge_id, project_id: @judge_evaluation.project_id, score: @judge_evaluation.score } }
    assert_redirected_to judge_evaluation_url(@judge_evaluation)
  end

  test "should destroy judge_evaluation" do
    assert_difference('JudgeEvaluation.count', -1) do
      delete judge_evaluation_url(@judge_evaluation)
    end

    assert_redirected_to judge_evaluations_url
  end
end
