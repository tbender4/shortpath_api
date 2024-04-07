# frozen_string_literal: true

# oh
class EventGuest < ApplicationRecord
  belongs_to :event
  belongs_to :contact

  accepts_nested_attributes_for :contact

  alias guest contact
  # Create a barcode service thing going on here
  def assign_barcode
    self.barcode = SecureRandom.hex(8)
  end
end
