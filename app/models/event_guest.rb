# frozen_string_literal: true

#
class EventGuest < ApplicationRecord
  belongs_to :event
  belongs_to :contact

  # Create a barcode service thing going on here
end
