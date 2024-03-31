require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { description: @event.description, group_id_id: @event.group_id_id, locationable_id_id: @event.locationable_id_id, rrule_data: @event.rrule_data, special_instructions: @event.special_instructions, string: @event.string, subject: @event.subject } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { description: @event.description, group_id_id: @event.group_id_id, locationable_id_id: @event.locationable_id_id, rrule_data: @event.rrule_data, special_instructions: @event.special_instructions, string: @event.string, subject: @event.subject } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
