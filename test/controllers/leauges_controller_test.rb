require "test_helper"

class LeaugesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leauge = leauges(:one)
  end

  test "should get index" do
    get leauges_url
    assert_response :success
  end

  test "should get new" do
    get new_leauge_url
    assert_response :success
  end

  test "should create leauge" do
    assert_difference('Leauge.count') do
      post leauges_url, params: { leauge: {  } }
    end

    assert_redirected_to leauge_url(Leauge.last)
  end

  test "should show leauge" do
    get leauge_url(@leauge)
    assert_response :success
  end

  test "should get edit" do
    get edit_leauge_url(@leauge)
    assert_response :success
  end

  test "should update leauge" do
    patch leauge_url(@leauge), params: { leauge: {  } }
    assert_redirected_to leauge_url(@leauge)
  end

  test "should destroy leauge" do
    assert_difference('Leauge.count', -1) do
      delete leauge_url(@leauge)
    end

    assert_redirected_to leauges_url
  end
end
