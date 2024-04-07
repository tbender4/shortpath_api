# frozen_string_literal: true

# I ideally want to axe this and replace it with event.rrule_data. But this will do for now.
class EventOccurrence < ApplicationRecord
  belongs_to :event

  has_one :visit

  validates :start_time, :end_time, presence: true
end
