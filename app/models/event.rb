# frozen_string_literal: true

# Scheduled visits are generated from user submitting an event.
class Event < ApplicationRecord
  belongs_to :group
  belongs_to :location, class_name: 'Space', foreign_key: 'locationable_id'
  belongs_to :space, foreign_key: 'locationable_id' # Same as above

  belongs_to :created_by_user, class_name: 'User', optional: true
  belongs_to :updated_by_user, class_name: 'User', optional: true

  has_many :event_guests, -> { includes(:contact) }
  has_many :guests, through: :event_guests, source: :contact
  accepts_nested_attributes_for :guests

  has_many :event_occurrences, dependent: :destroy_async
  has_many :visits, through: :event_occurrences # TODO: Destroy_async?

  has_many :event_organizers, dependent: :destroy_async
  has_many :organizers, through: :event_organizers, source: :user

  attr_accessor :duration

  validates :group, :space, :rrule_data, :location, presence: true

  before_create :generate_event_occurrences
  after_save :generate_visits!

  before_update :update_event_occurrences, if: :rrule_data_changed?
  # TODO: around-save visits records
  # TODO: Update PUT-friendly generate_event_occurrences

  # RRULE -> EventOccurrences
  def generate_event_occurrences
    return if rrule_data.blank?

    duration ||= 1.hour
    tzid = space&.building&.address&.time_zone
    dates = RRule.parse(rrule_data, tzid:)
    self.event_occurrences = dates.map do |date|
      start_time = date.change(sec: 0, usec: 0)
      end_time = start_time + duration
      EventOccurrence.new({ event: self, start_time:, end_time: })
    end
  end

  # event_occurrences PUT-friendly
  # def update_event_occurrences
  #   return if rrule_data.blank?

  #   tzid = space&.building&.address&.time_zone
  #   new_dates = RRule.parse(rrule_data, tzid:)
  #   new_dates_set = new_dates.to_set
    
  #   updates_event_occurrrences = []
  #   # dates = RRule.parse(rrule_data)
  #   now = DateTime.now
  #   event_occurrences.each do |event_occ|
  #     # Event Occurrences in the past are not to be deleted
  #     if occurrence.start_time.beginning_of_day < DateTime.now.beginning_of_day
  #       updates_event_occurrrences << event_occ
  #       next
  #     end
  #     updates_event_occurrrences
  #     return event_occ if event_occ.start_time <= now


  #   end

  # end

  # To be created after EventOccurrences and EventGuests have completed for an event
  # It should be PUT-ready
  def generate_visits!(first_time: false)
    event_occurrences.flat_map do |event_occurrence|
      guests.map do |guest|
        visit = Visit.where(event_occurrence:, guest:).first unless first_time
        visit ||= Visit.create!(event_occurrence:, guest:)
        visit
      end
    end
  end
end
