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

  def self.test(test = nil)
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
    guests = test.delete(guests)
    event = Event.create test
    event.generate_guests guests
    # event.event_occurrences.map do |event_occurrence|
    #   event.guests.map do |event_guest|
    #     contact = event_guest.contact
    #     Visit.create(event_occurrence:, contact:)
    #   end
    # end
  end

  private

  # https://github.com/rails/rails/issues/7256#issuecomment-455041921
  def generate_guests(guests_attributes)
    self.guests = guests_attributes.map do |guest_attributes|
      guest_id = guest_attributes.delete :id
      guest = Contact.where(id: guest_id).first
      guest ||= Contact.new
      guest.update(guest_attributes)
    end
  end
end
