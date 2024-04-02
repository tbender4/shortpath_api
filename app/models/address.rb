# frozen_string_literal: true

# at the moment just the address of a building
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  before_validation do
    self.time_zone ||= Rails.application.config.time_zone
  end

  validates :time_zone, inclusion: { in: VALID_TIME_ZONES, message: 'is not a valid time zone' }
end
