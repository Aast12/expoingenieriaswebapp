require 'test_helper'

class SocialImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_impact = social_impacts(:one)
  end

  test "should get index" do
    get social_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_social_impact_url
    assert_response :success
  end

  test "should create social_impact" do
    assert_difference('SocialImpact.count') do
      post social_impacts_url, params: { social_impact: { social_commitment: @social_impact.social_commitment, social_cause: @social_impact.social_cause, project_id: @social_impact.project_id, integrity: @social_impact.integrity } }
    end

    assert_redirected_to social_impact_url(SocialImpact.last)
  end

  test "should show social_impact" do
    get social_impact_url(@social_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_impact_url(@social_impact)
    assert_response :success
  end

  test "should update social_impact" do
    patch social_impact_url(@social_impact), params: { social_impact: { social_commitment: @social_impact.social_commitment, social_cause: @social_impact.social_cause, project_id: @social_impact.project_id, integrity: @social_impact.integrity } }
    assert_redirected_to social_impact_url(@social_impact)
  end

  test "should destroy social_impact" do
    assert_difference('SocialImpact.count', -1) do
      delete social_impact_url(@social_impact)
    end

    assert_redirected_to social_impacts_url
  end
end
