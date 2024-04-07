require "application_system_test_case"

class VisitsTest < ApplicationSystemTestCase
  setup do
    @visit = visits(:one)
  end

  test "visiting the index" do
    visit visits_url
    assert_selector "h1", text: "Visits"
  end

  test "should create visit" do
    visit visits_url
    click_on "New visit"

    fill_in "Barcode", with: @visit.barcode
    check "Barcode disabled" if @visit.barcode_disabled
    fill_in "Barcode disabled at", with: @visit.barcode_disabled_at
    fill_in "Barcode disabled by user", with: @visit.barcode_disabled_by_user_id
    fill_in "Checked in at", with: @visit.checked_in_at
    fill_in "Checked in by user", with: @visit.checked_in_by_user
    fill_in "Checked out at", with: @visit.checked_out_at
    fill_in "Checked out by user", with: @visit.checked_out_by_user
    fill_in "Contact", with: @visit.contact_id
    fill_in "Event occurrence", with: @visit.event_occurrence_id
    fill_in "Notes", with: @visit.notes
    fill_in "State", with: @visit.state
    click_on "Create Visit"

    assert_text "Visit was successfully created"
    click_on "Back"
  end

  test "should update Visit" do
    visit visit_url(@visit)
    click_on "Edit this visit", match: :first

    fill_in "Barcode", with: @visit.barcode
    check "Barcode disabled" if @visit.barcode_disabled
    fill_in "Barcode disabled at", with: @visit.barcode_disabled_at
    fill_in "Barcode disabled by user", with: @visit.barcode_disabled_by_user_id
    fill_in "Checked in at", with: @visit.checked_in_at
    fill_in "Checked in by user", with: @visit.checked_in_by_user
    fill_in "Checked out at", with: @visit.checked_out_at
    fill_in "Checked out by user", with: @visit.checked_out_by_user
    fill_in "Contact", with: @visit.contact_id
    fill_in "Event occurrence", with: @visit.event_occurrence_id
    fill_in "Notes", with: @visit.notes
    fill_in "State", with: @visit.state
    click_on "Update Visit"

    assert_text "Visit was successfully updated"
    click_on "Back"
  end

  test "should destroy Visit" do
    visit visit_url(@visit)
    click_on "Destroy this visit", match: :first

    assert_text "Visit was successfully destroyed"
  end
end
