require 'test_helper'

class VirtualSamplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @virtual_sample = virtual_samples(:one)
  end

  test "should get index" do
    get virtual_samples_url
    assert_response :success
  end

  test "should get new" do
    get new_virtual_sample_url
    assert_response :success
  end

  test "should create virtual_sample" do
    assert_difference('VirtualSample.count') do
      post virtual_samples_url, params: { virtual_sample: {  } }
    end

    assert_redirected_to virtual_sample_url(VirtualSample.last)
  end

  test "should show virtual_sample" do
    get virtual_sample_url(@virtual_sample)
    assert_response :success
  end

  test "should get edit" do
    get edit_virtual_sample_url(@virtual_sample)
    assert_response :success
  end

  test "should update virtual_sample" do
    patch virtual_sample_url(@virtual_sample), params: { virtual_sample: {  } }
    assert_redirected_to virtual_sample_url(@virtual_sample)
  end

  test "should destroy virtual_sample" do
    assert_difference('VirtualSample.count', -1) do
      delete virtual_sample_url(@virtual_sample)
    end

    assert_redirected_to virtual_samples_url
  end
end
