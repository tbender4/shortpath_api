# frozen_string_literal: true

# Scheduled visits are generated from user submitting an event.
class Event < ApplicationRecord
  belongs_to :group
  belongs_to :location, class_name: 'Space', foreign_key: 'locationable_id'
  belongs_to :space, foreign_key: 'locationable_id' # Same as above

  belongs_to :created_by_user, class_name: 'User'
  belongs_to :updated_by_user, class_name: 'User'

  validates :group, :space, :rrule_data, presence: true

  has_many :event_guests, -> { includes(:contact) }
  has_many :guests, through: :event_guests, source: :contact
  accepts_nested_attributes_for :guests

  has_many :event_occurrences, dependent: :destroy_async
  has_many :visits, through: :event_occurrences

  before_create :generate_event_occurrences

  # handle organizers when I get there
  # Event Occurrence processor? Maybe. IDK

  # RRULE -> EventOccurrences
  def generate_event_occurrences(duration = 1.hour)
    return if rrule_data.blank?

    dates = RRule.parse(rrule_data)
    self.event_occurrences = dates.map do |start_time|
      end_time = start_time + duration
      EventOccurrence.new({ event: self, start_time:, end_time: })
    end
  end

  # To be created after EventOccurrences and EventGuests have completed for an event
  def generate_visits!
    event_occurrences.flat_map do |event_occurrence|
      guests.map do |guest|
        Visit.create!(event_occurrence:, guest:)
      end
    end
  end

  # Quick tester
  def self.generate_with_guests(test = nil)
    test ||= {
      subject: 'testing',
      description: 'this is a nested test',
      group: Group.first,
      space: Space.first,
      rrule_data: 'FREQ=DAILY;COUNT=3',
      guest_ids: [3], # put existing IDs here. Be careful, omitting IDs on a PUT will strip them.
      guests_attributes: [
        {
          first_name: 'Billy',
          last_name: 'Bob'
        }
      ]
    }

    event = Event.create test
    # event.generate_guests! guests
    event.generate_visits!
    event
  end

  def self.update_existing_test(test = nil)
    test ||= {
      guest_ids: [3]
    }
    e = Event.last
    e.update! test
    e
  end
end
