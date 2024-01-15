require "test_helper"

class MinimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minimage = minimages(:one)
  end

  test "should get index" do
    get minimages_url
    assert_response :success
  end

  test "should get new" do
    get new_minimage_url
    assert_response :success
  end

  test "should create minimage" do
    assert_difference("Minimage.count") do
      post minimages_url, params: { minimage: {  } }
    end

    assert_redirected_to minimage_url(Minimage.last)
  end

  test "should show minimage" do
    get minimage_url(@minimage)
    assert_response :success
  end

  test "should get edit" do
    get edit_minimage_url(@minimage)
    assert_response :success
  end

  test "should update minimage" do
    patch minimage_url(@minimage), params: { minimage: {  } }
    assert_redirected_to minimage_url(@minimage)
  end

  test "should destroy minimage" do
    assert_difference("Minimage.count", -1) do
      delete minimage_url(@minimage)
    end

    assert_redirected_to minimages_url
  end
end
