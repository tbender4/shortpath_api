# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'create basic event' do
    data = {
      subject: 'testing',
      description: 'this is a nested test',
      group: Group.first,
      space: Space.first,
      rrule_data: 'RRULE:FREQ=DAILY;COUNT=3;BYHOUR=13;BYMINUTE=0',
      # guest_ids: [3], # put existing IDs here. Be careful, omitting IDs on a PUT will strip them.
      guests_attributes: [
        {
          first_name: 'Billy',
          last_name: 'Bob'
        }
      ]
    }
    event = Event.create data
    visits = event.visits
    # visits = event.generate_visits!
    assert event && visits.present?
  end

  test 'update event' do
    event = Event.last
    test = {
      guest_ids: [3]
    }
    event.update! test
    assert test
  end
end
