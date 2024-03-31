# frozen_string_literal: true

# NOTE: This becomes a global constant. Not the worst thing but perhaps we make this an initializer if
# this must leave this file.
VALID_TIME_ZONES = ActiveSupport::TimeZone.all.map(&:name).freeze

# at the moment just the address of a building
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  before_validation do
    self.time_zone ||= Rails.application.config.time_zone
  end

  validates :time_zone, inclusion: { in: VALID_TIME_ZONES, message: 'is not a valid time zone' }
end
