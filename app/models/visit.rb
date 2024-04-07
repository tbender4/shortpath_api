# frozen_string_literal: true

# Join table of EventOccurrence and the guest, along with other attributes.
class Visit < ApplicationRecord
  belongs_to :event_occurrence
  belongs_to :contact
  belongs_to :guest, class_name: 'Contact', foreign_key: 'contact_id' # alias

  belongs_to :checked_in_by_user, class_name: 'User', optional: true
  belongs_to :checked_out_by_user, class_name: 'User', optional: true

  has_one :event, through: :event_occurrence

  validates :event_occurrence, :contact, presence: true
  belongs_to :barcode_disabled_by_user, class_name: 'User', optional: true

  state_machine :state, initial: :scheduled do
    before_transition on: :reset, do: :reset_visit
    before_transition on: :check_in, do: ->(visit) { visit.checked_in_at ||= DateTime.now }
    before_transition on: :check_out, do: ->(visit) { visit.checked_out_at = DateTime.now }
    event :check_in do
      transition scheduled: :checked_in, if: :can_check_in?
    end
    event :check_out do
      transition %i[scheduled checked_in] => :checked_out
    end
    event :reset do
      transition any => :scheduled
    end
  end

  private

  def can_check_in?
    return true if checked_in_by_user.present?

    errors.add(:checked_in_by_user, 'must be present to check in.')
    false
  end

  def can_check_out?
    checked_out_by_user.present?

    errors.add(:checked_out_by_user, 'must be present to check out.')
  end

  def reset_visit
    self.checked_in_at = nil
    self.checked_in_by_user = nil
    self.checked_out_at = nil
    self.checked_out_by_user = nil
  end
end
