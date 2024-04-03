# frozen_string_literal: true

VALID_TIME_ZONES = ActiveSupport::TimeZone.all.map(&:name).freeze
