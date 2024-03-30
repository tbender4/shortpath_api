require "application_system_test_case"

class LocationablesTest < ApplicationSystemTestCase
  setup do
    @locationable = locationables(:one)
  end

  test "visiting the index" do
    visit locationables_url
    assert_selector "h1", text: "Locationables"
  end

  test "should create locationable" do
    visit locationables_url
    click_on "New locationable"

    click_on "Create Locationable"

    assert_text "Locationable was successfully created"
    click_on "Back"
  end

  test "should update Locationable" do
    visit locationable_url(@locationable)
    click_on "Edit this locationable", match: :first

    click_on "Update Locationable"

    assert_text "Locationable was successfully updated"
    click_on "Back"
  end

  test "should destroy Locationable" do
    visit locationable_url(@locationable)
    click_on "Destroy this locationable", match: :first

    assert_text "Locationable was successfully destroyed"
  end
end
