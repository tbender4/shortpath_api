require "test_helper"

class EventOccurrencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_occurrence = event_occurrences(:one)
  end

  test "should get index" do
    get event_occurrences_url
    assert_response :success
  end

  test "should get new" do
    get new_event_occurrence_url
    assert_response :success
  end

  test "should create event_occurrence" do
    assert_difference("EventOccurrence.count") do
      post event_occurrences_url, params: { event_occurrence: { end_time: @event_occurrence.end_time, event_id: @event_occurrence.event_id, start_time: @event_occurrence.start_time } }
    end

    assert_redirected_to event_occurrence_url(EventOccurrence.last)
  end

  test "should show event_occurrence" do
    get event_occurrence_url(@event_occurrence)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_occurrence_url(@event_occurrence)
    assert_response :success
  end

  test "should update event_occurrence" do
    patch event_occurrence_url(@event_occurrence), params: { event_occurrence: { end_time: @event_occurrence.end_time, event_id: @event_occurrence.event_id, start_time: @event_occurrence.start_time } }
    assert_redirected_to event_occurrence_url(@event_occurrence)
  end

  test "should destroy event_occurrence" do
    assert_difference("EventOccurrence.count", -1) do
      delete event_occurrence_url(@event_occurrence)
    end

    assert_redirected_to event_occurrences_url
  end
end
