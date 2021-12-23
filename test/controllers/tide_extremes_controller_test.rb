require "test_helper"

class TideExtremesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tide_extreme = tide_extremes(:one)
  end

  test "should get index" do
    get tide_extremes_url
    assert_response :success
  end

  test "should get new" do
    get new_tide_extreme_url
    assert_response :success
  end

  test "should create tide_extreme" do
    assert_difference('TideExtreme.count') do
      post tide_extremes_url, params: { tide_extreme: {  } }
    end

    assert_redirected_to tide_extreme_url(TideExtreme.last)
  end

  test "should show tide_extreme" do
    get tide_extreme_url(@tide_extreme)
    assert_response :success
  end

  test "should get edit" do
    get edit_tide_extreme_url(@tide_extreme)
    assert_response :success
  end

  test "should update tide_extreme" do
    patch tide_extreme_url(@tide_extreme), params: { tide_extreme: {  } }
    assert_redirected_to tide_extreme_url(@tide_extreme)
  end

  test "should destroy tide_extreme" do
    assert_difference('TideExtreme.count', -1) do
      delete tide_extreme_url(@tide_extreme)
    end

    assert_redirected_to tide_extremes_url
  end
end
