require "application_system_test_case"

class MinimagesTest < ApplicationSystemTestCase
  setup do
    @minimage = minimages(:one)
  end

  test "visiting the index" do
    visit minimages_url
    assert_selector "h1", text: "Minimages"
  end

  test "should create minimage" do
    visit minimages_url
    click_on "New minimage"

    click_on "Create Minimage"

    assert_text "Minimage was successfully created"
    click_on "Back"
  end

  test "should update Minimage" do
    visit minimage_url(@minimage)
    click_on "Edit this minimage", match: :first

    click_on "Update Minimage"

    assert_text "Minimage was successfully updated"
    click_on "Back"
  end

  test "should destroy Minimage" do
    visit minimage_url(@minimage)
    click_on "Destroy this minimage", match: :first

    assert_text "Minimage was successfully destroyed"
  end
end
