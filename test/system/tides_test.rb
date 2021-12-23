require "application_system_test_case"

class TidesTest < ApplicationSystemTestCase
  setup do
    @tide = tides(:one)
  end

  test "visiting the index" do
    visit tides_url
    assert_selector "h1", text: "Tides"
  end

  test "creating a Tide" do
    visit tides_url
    click_on "New Tide"

    click_on "Create Tide"

    assert_text "Tide was successfully created"
    click_on "Back"
  end

  test "updating a Tide" do
    visit tides_url
    click_on "Edit", match: :first

    click_on "Update Tide"

    assert_text "Tide was successfully updated"
    click_on "Back"
  end

  test "destroying a Tide" do
    visit tides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tide was successfully destroyed"
  end
end
