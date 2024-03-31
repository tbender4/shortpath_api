require "application_system_test_case"

class EventGuestsTest < ApplicationSystemTestCase
  setup do
    @event_guest = event_guests(:one)
  end

  test "visiting the index" do
    visit event_guests_url
    assert_selector "h1", text: "Event guests"
  end

  test "should create event guest" do
    visit event_guests_url
    click_on "New event guest"

    fill_in "Barcode", with: @event_guest.barcode
    fill_in "Contact id", with: @event_guest.contact_id_id
    fill_in "Event id", with: @event_guest.event_id_id
    click_on "Create Event guest"

    assert_text "Event guest was successfully created"
    click_on "Back"
  end

  test "should update Event guest" do
    visit event_guest_url(@event_guest)
    click_on "Edit this event guest", match: :first

    fill_in "Barcode", with: @event_guest.barcode
    fill_in "Contact id", with: @event_guest.contact_id_id
    fill_in "Event id", with: @event_guest.event_id_id
    click_on "Update Event guest"

    assert_text "Event guest was successfully updated"
    click_on "Back"
  end

  test "should destroy Event guest" do
    visit event_guest_url(@event_guest)
    click_on "Destroy this event guest", match: :first

    assert_text "Event guest was successfully destroyed"
  end
end
