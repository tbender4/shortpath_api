# frozen_string_literal: true

# Scheduled visits are generated from user submitting an event.
class Event < ApplicationRecord
  belongs_to :group
  belongs_to :location, class_name: 'Space', foreign_key: 'locationable_id'
  belongs_to :space, foreign_key: 'locationable_id' # Same as above

  validates :group, :space, :rrule_data, presence: true

  has_many :event_guests, -> { includes(:contact) }
  has_many :guests, through: :event_guests, source: :contact

  # accepts_nested_attributes_for :guests
  has_many :event_occurrences, dependent: :destroy_async

  before_create :generate_event_occurrences

  # handle organizers when I get there
  # Event Occurrence processor? Maybe. IDK

  # RRULE -> EventOccurrences
  def generate_event_occurrences(duration = 1.hour)
    dates = RRule.parse(rrule_data)
    self.event_occurrences = dates.map do |start_time|
      end_time = start_time + duration
      EventOccurrence.new({ event: self, start_time:, end_time: })
    end
  end

  def generate_guests!(guests_attributes)
    self.guests = guests_attributes.map do |guest_attributes|
      guest_id = guest_attributes.delete :id
      guest = Contact.where(id: guest_id).first
      guest ||= Contact.new
      guest.assign_attributes(guest_attributes)
      guest
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

  def self.create_test(test = nil)
    test ||= {
      subject: 'testing',
      description: 'this is a nested test',
      group: Group.first,
      space: Space.first,
      rrule_data: 'FREQ=DAILY;COUNT=3',
      guests: [
        {
          first_name: 'Billy',
          last_name: 'Bob'
        },
        { id: 2 }
      ]
    }
    guests = test.delete(:guests)
    event = Event.create test
    event.generate_guests! guests
    event.generate_visits!
  end
end
