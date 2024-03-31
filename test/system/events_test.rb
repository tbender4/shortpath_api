require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit events_url
    click_on "New event"

    fill_in "Description", with: @event.description
    fill_in "Group id", with: @event.group_id_id
    fill_in "Locationable id", with: @event.locationable_id_id
    fill_in "Rrule data", with: @event.rrule_data
    fill_in "Special instructions", with: @event.special_instructions
    fill_in "String", with: @event.string
    fill_in "Subject", with: @event.subject
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit event_url(@event)
    click_on "Edit this event", match: :first

    fill_in "Description", with: @event.description
    fill_in "Group id", with: @event.group_id_id
    fill_in "Locationable id", with: @event.locationable_id_id
    fill_in "Rrule data", with: @event.rrule_data
    fill_in "Special instructions", with: @event.special_instructions
    fill_in "String", with: @event.string
    fill_in "Subject", with: @event.subject
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit event_url(@event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end
