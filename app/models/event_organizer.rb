# frozen_string_literal: true

# First one is the "host" of the event. Other organizers are just there to get the notifications
class EventOrganizer < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
