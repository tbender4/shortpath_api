# frozen_string_literal: true

# Join table of EventOccurrence and the guest, along with other attributes.
class Visit < ApplicationRecord
  belongs_to :event_occurrence
  belongs_to :contact
  belongs_to :guest, class_name: 'Contact', foreign_key: 'contact_id' # alias

  validates :event_occurrence, :contact, presence: true
  belongs_to :barcode_disabled_by_user, class_name: 'User', optional: true
end
