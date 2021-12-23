require "application_system_test_case"

class TideExtremesTest < ApplicationSystemTestCase
  setup do
    @tide_extreme = tide_extremes(:one)
  end

  test "visiting the index" do
    visit tide_extremes_url
    assert_selector "h1", text: "Tide Extremes"
  end

  test "creating a Tide extreme" do
    visit tide_extremes_url
    click_on "New Tide Extreme"

    click_on "Create Tide extreme"

    assert_text "Tide extreme was successfully created"
    click_on "Back"
  end

  test "updating a Tide extreme" do
    visit tide_extremes_url
    click_on "Edit", match: :first

    click_on "Update Tide extreme"

    assert_text "Tide extreme was successfully updated"
    click_on "Back"
  end

  test "destroying a Tide extreme" do
    visit tide_extremes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tide extreme was successfully destroyed"
  end
end
