require "test_helper"

class TidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tide = tides(:one)
  end

  test "should get index" do
    get tides_url
    assert_response :success
  end

  test "should get new" do
    get new_tide_url
    assert_response :success
  end

  test "should create tide" do
    assert_difference('Tide.count') do
      post tides_url, params: { tide: {  } }
    end

    assert_redirected_to tide_url(Tide.last)
  end

  test "should show tide" do
    get tide_url(@tide)
    assert_response :success
  end

  test "should get edit" do
    get edit_tide_url(@tide)
    assert_response :success
  end

  test "should update tide" do
    patch tide_url(@tide), params: { tide: {  } }
    assert_redirected_to tide_url(@tide)
  end

  test "should destroy tide" do
    assert_difference('Tide.count', -1) do
      delete tide_url(@tide)
    end

    assert_redirected_to tides_url
  end
end
