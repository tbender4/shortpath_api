# frozen_string_literal: true

# Scheduled visits are generated from user submitting an event.
class Event < ApplicationRecord
  belongs_to :group
  belongs_to :location, class_name: 'Space', foreign_key: 'locationable_id'
  belongs_to :space, foreign_key: 'locationable_id' # Same as above
  has_many :event_guests, -> { includes(:contact) }
  # Do we need redundant has_many guests reference? Probably not.
end
